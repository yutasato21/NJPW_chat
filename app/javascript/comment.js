function post () {
  const commentBtn = document.getElementById("comment_btn");
  commentBtn.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "http://localhost:3000/rooms/2/comments", true)
    XHR.responseType = "json";
    XHR.send(formData);
  });
};

window.addEventListener("load", post)