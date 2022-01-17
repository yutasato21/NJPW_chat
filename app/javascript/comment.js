const buildHTML = (XHR) => {
  const item = XHR.response.comment;
  const html = `
    <div class="comment_post">
      <div class="comment_create">
        ${item.created_at}
      </div>
      <div class="comment_nickname">
        ${item.username}
      </div>
      <div class="comment_content">
        ${item.content}
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