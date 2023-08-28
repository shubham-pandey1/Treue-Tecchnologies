/**
 * 
 */


//const toastLiveExample = document.getElementById('liveToast')
//const toastBootstrap = new bootstrap.Toast(toastLiveExample)
  
  //  toastBootstrap.show()
 const myToast = new bootstrap.Toast('.toast');
 myToast.show();
 setTimeout(()=> {
	 myToast.hide();
 }, 4000);

  