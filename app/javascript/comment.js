const buildHTML = (XHR) => {
  const comment = XHR.response.comment;
  const userName = XHR.response.user;
  const time = XHR.response.time;
  const html = `
    <div class="comment_post">
      <div class="comment_create">
        ${time}
      </div>
      <div class="comment_nickname">
        ${userName}
      </div>
      <div class="comment_content">
        ${comment.content}
      </div>
    </div>`;
  return html;
};

function post () {
  const commentBtn = document.getElementById("comment_btn");
  commentBtn.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    const roomPath = location.href
    XHR.open("POST", `${roomPath}`, true)
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      list.insertAdjacentHTML("afterend", buildHTML(XHR));
      formText.value = "";
    };
  });
};

window.addEventListener("load", post)