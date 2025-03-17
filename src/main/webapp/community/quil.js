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
});

$("#test").click(()=>{
	const file = convertBase64ImgToImgFile($("#img-0").attr("src"),"img-0.png")
	uploadImage(file)
	//console.log($("#form"))
	//axiosTest();
})
const axiosTest = () =>{
	axios.post(`${serverURL}/community/image_convert.do`,
			{
				params:{image:"test blank"},
			}).then((res)=>{
			console.log(res)
	})
}

const imageUploadAndConvertedImageApply = (id) => {//이미지 업로드하고 가져오기
	const file = convertBase64ImgToImgFile($(`#${id}`).attr("src"),`${id}.png`)
	uploadImage(file,id)
}

const uploadImage = (file,id) =>{//이미지를 서버에 업로드
	const formData = new FormData();
	//formData에 문자열도 보낼 수 있게 해서 게시물번호도 전송할 수 있도록 처리
	formData.append("userfile", file);
	formData.append("postID",$("#editor").data('postid'));
	axios.post(`${serverURL}/community/image_convert.do`, formData, 
	{
		headers: {
	   		"Content-Type": "multipart/form-data",
	    },
	}).then(
		(res)=>{
			const imageURL = `${serverURL}/community/get_converted_image.do?image=${res.data.imageName}`
			$(`#${id}`).attr('src',imageURL)
		}
	
	);
	
	formData.forEach(function(value, key) {//form데이터 console.log로 출력하면 값 안나옴. 순회해서 출력해야됨
	    console.log(key + ': ' + value);
	});
}

const serverImageDelete = (deletedImages) => {
	const deleteImageNames = deletedImages.map((image)=>{
		return image.src.split("?image=")[1]
	}).join()
	axios.post(`${serverURL}/community/delete_image.do`,null,
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
	
const imageOnclick = (e) =>{
	console.log(e.target)
}

let imageTags=[];
let imageId=0;//있는 문서 수정하는 경우일 때는 미리 이미지 리스트 에서 마지막 이미지의 아이디 가져와서 설정하기
quill.on('text-change', function() {

	
	console.log("postid",$("#editor").data('postid'))
	//quill에 추가된 요소중에 이미지만 리스트에 모으고 아이디를 추가하는 코드
	const changedImage = Array.from(quill.root.querySelectorAll("*"))
		    				.filter((child)=>{
								if(child.nodeName==='IMG'){
									if(child.id.length===0){
										child.id='img-'+imageId++;
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
		
		
		//console.log(deletedImages)
		serverImageDelete(deletedImages)
	}
  
	imageTags=changedImage
	//console.log("imageTags",imageTags)
});

const save = () =>{
	window.removeEventListener('beforeunload', handleBeforeUnload);
	window.onunload=null;
	
	let htmlcontent = quill.root.innerHTML;
	let htmlBlob = new Blob([htmlcontent], { type: 'text/html' });
	let htmlFile = new File([htmlBlob], 'quill_content.html', { type: 'text/html' });
	let formData = new FormData();
	formData.append('file', htmlFile);  // 파일이 HTML 형식일 경우
	formData.append('board_no', $("#editor").data('postid'));
	formData.append('id', $("#editor").data('userid'));
	formData.append('subject', $("input[name=subject]").val());
	formData.append('tag', $("select").val());
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

