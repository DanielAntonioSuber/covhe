const btnComment = document.querySelectorAll(".publication__actions-comment");
const commentBox = document.getElementById("commentBox");
const btnCancelar = document.getElementById("cancelar");
const commentText = document.getElementById("commentText");
const btnComments = document.querySelectorAll(".publication__actions-comments");

const toggleComment = () => {
  commentText.value = null;
  if (commentBox.hidden) {
    commentBox.hidden = false;
  } else {
    commentBox.hidden = true;
  }
  commentBox.classList.toggle("comment-active");
  commentBox.firstElementChild.firstElementChild.value = null;
};

const toggleComments = (e) => {
  const target = e.target;
  const publication = target.parentElement.parentElement;
  const publicationComments = publication.lastElementChild;
  if (publicationComments.hidden) {
    publicationComments.hidden = false;
  } else {
    publicationComments.hidden = true;
  }

}

btnCancelar.addEventListener("click", toggleComment)


btnComment.forEach((btn) =>
  btn.addEventListener("click", () => {
    toggleComment();
    const idPublication = btn.previousElementSibling.value;
    commentBox.firstElementChild.firstElementChild.value = idPublication;
  })
);

btnComments.forEach((btn) => btn.addEventListener('click', toggleComments))