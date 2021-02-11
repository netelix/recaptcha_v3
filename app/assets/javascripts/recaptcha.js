function openModal() {
  var modal = document.getElementById('gmModal');
  modal.style.display = "block";
}
function closeModal() {
  var modal = document.getElementById('gmModal');
  modal.style.display = "none";
}
window.onclick = function(event) {
  var modal = document.getElementById('gmModal');
  if (event.target == modal) {
    modal.style.display = "none";
  }
}