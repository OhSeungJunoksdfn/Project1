const serverURL = "http://localhost:8080/CocktailProject1"

const toolbarOptions = [
	[{ 'header': [1, 2, 3, 4, 5, 6, false] }],
    ['bold', 'italic', 'underline', 'strike'],
    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
    [{ 'color': [] }, { 'background': [] }],
	[{'align':[]}],
	['image']
];
const options = {
	debug: false,
	modules: {
		toolbar: toolbarOptions,
	},
	theme: 'snow'
};


const quill = new Quill('#editor', options);
$(document).ready(function(){
	$('.ql-toolbar.ql-snow').css('text-align','left')
	$(".ql-editor").css({"overflow":"hidden","min-height":"500px"})
});

$("#test").click(()=>{
	const file = convertBase64ImgToImgFile($("#img-0").attr("src"),"img-0.png")
	uploadImage(file)
	//console.log($("#form"))
	//axiosTest();
})

const imageUploadAndConvertedImageApply = (id) => {//이미지 업로드하고 가져오기
	const file = convertBase64ImgToImgFile($(`#${id}`).attr("src"),`${id}.png`)
	uploadImage(file,id)
}

const uploadImage = (file,id) =>{//이미지를 서버에 업로드
	const formData = new FormData();
	//formData에 문자열도 보낼 수 있게 해서 게시물번호도 전송할 수 있도록 처리
	formData.append("userfile", file);
	formData.append("postID",$("#editor").data('postid'));
	axios.post(`../community/image_convert.do`, formData, 
	{
		headers: {
	   		"Content-Type": "multipart/form-data",
	    },
	}).then(
		(res)=>{
			const imageURL = `../community/get_converted_image.do?image=${res.data.imageName}`
			$(`#${id}`).attr('src',imageURL)
			$(`#${id}`).css({"max-width":"100%","max-height":"100%"})
		}
	);
	
}

const serverImageDelete = (deletedImages) => {
	const deleteImageNames = deletedImages.map((image)=>{
		return image.src.split("?image=")[1]
	}).join()
	axios.post(`../community/delete_image.do`,null,
		{params:{imageNames:deleteImageNames}}
		).then((res)=>{
		console.log(res)
	})
}

const convertBase64ImgToImgFile = (data, fileName) => {//base64이미지를 이미지파일로 변경
	const arr = data.split(',') // arr = [data:image/jpg;base64 , /9j/4AAQSkZJRgABAQAAAQABA ...]
	const [mime, binaryData] = [arr[0].match(/:(.*?);/)[1], atob(arr[1])] // atob는 base64 data를 decode한다
	// mime = image/jpg
	// binrayData = image의 binary data (atob는 window 내장 객체로 base64 data를 decode하는 메소드이다.)
	let n = binaryData.length 
	let unit8Array = new Uint8Array(n); 
	// binrayData를 다루기 위해 unit8Array Typpedarray 이용 
	// 이미지 데이터는 각 픽셀단위로 0~255로 표현되기 때문에 unit8Array를 이용하는 게 효율적 
	while (n--) {
    	unit8Array[n] = binaryData.charCodeAt(n) 
		// charCodeAt(n)은 array의 index=n 문자의 유니 코드 값을 반환한다.
	}
	return new File([unit8Array], fileName, { type: mime })
}

const handleOnUnload = function () {//페이지가 실제로 닫힐 때 수행할 작업
	const data = new FormData();
	data.append('board_no', $("#editor").data('postid'));
	
	const imagenames_to_delete = image_to_delete.map((image)=>{
			return image.src.split("?image=")[1]
		}).join()
	data.append('imagenames_to_delete',imagenames_to_delete)
	navigator.sendBeacon('../community/freeboard_delete_unsaved.do',data);
};
window.onunload= handleOnUnload;//페이지가 실제로 닫힐 때 수행할 작업(quill.js)

let imageTags=[];
let prevHeight = 500
let image_to_delete = []
quill.on('text-change', function() {

	let imageId=Array.from(quill.root.querySelectorAll("*"))//편집할 문서에 포함된 이미지 태그들의 아이디에서 가장 큰 숫자에서 1을 더해서 다음에 삽입될 이미지의 아이디 정하기
			    		.reduce((acc,child)=>{
							if(child.nodeName==='IMG'&child.id.length!==0)
							{
								const id = Number(child.id.split('-')[1])+1
								return id>acc?id:acc
							}
							return acc
						},0)
	console.log(imageId)
	//quill에 추가된 요소중에 이미지만 리스트에 모으고 아이디를 추가하는 코드
	const changedImage = Array.from(quill.root.querySelectorAll("*"))
		    				.filter((child)=>{
								if(child.nodeName==='IMG'){
									if(child.id.length===0){
										child.id='img-'+imageId;
										imageUploadAndConvertedImageApply(child.id);
									}
									return true
								}
		  						return false
							})
							
							
	if(imageTags.length>changedImage.length){//방금 변화가 이미지 삭제일 경우
		
		//이미지는 드래그해서 한번에 여러개 삭제할 수 있으므로 리스트로 처리
		const deletedImages=imageTags.filter((child)=>{
	  		return !changedImage.includes(child)
	  	})
		
		
		console.log(deletedImages)
		
		image_to_delete = [...image_to_delete,...deletedImages]
		//serverImageDelete(deletedImages)
	}
  
	imageTags=changedImage
	//console.log("imageTags",imageTags)
	
	
	let contentHeight = quill.root.scrollHeight;// quill 내용 길어지거나 짧아지면 에디터 높이 조절
	
	if(contentHeight<prevHeight)
	{
		$("#editor").css({"height":"0px"})
	}
	$("#editor").css({"height":quill.root.scrollHeight})
	prevHeight=contentHeight
	
	console.log(image_to_delete)
	
});


const save = () =>{
	window.removeEventListener('beforeunload', handleBeforeUnload);
	window.onunload=null;
	
	let htmlcontent = quill.root.innerHTML;
	let htmlBlob = new Blob([htmlcontent], { type: 'text/html' });
	let htmlFile = new File([htmlBlob], $("#editor").data('filename'), { type: 'text/html' });
	let formData = new FormData();
	formData.append('file', htmlFile);  // 파일이 HTML 형식일 경우
	formData.append('board_no', $("#editor").data('postid'));
	formData.append('id', $("#editor").data('userid'));
	formData.append('subject', $("input[name=subject]").val());
	formData.append('tag', $("select").val());
	formData.append('documentheight',quill.root.scrollHeight)
	formData.append('content',quill.getText())
	const imagenames_to_delete = image_to_delete.map((image)=>{
				return image.src.split("?image=")[1]
			}).join()
	formData.append('imagenames_to_delete',imagenames_to_delete)
	
	$.ajax({
		type:'post',
		url:'../community/freeboard_insert.do',
		data:formData,
		contentType: false,
		processData: false,
		success:function(result){
			location.href="../community/freeboard_list.do"
		}
	})
	
}

