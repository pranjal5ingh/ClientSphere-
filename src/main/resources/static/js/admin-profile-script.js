const sidebar = document.getElementById('sidebar');
const btnToggle = document.getElementById('btnToggle');

btnToggle.addEventListener('click', () => {
  sidebar.classList.toggle('collapsed');
});

// Auto collapse on small screen
function handleResize() {
  if (window.innerWidth < 992) {
    sidebar.classList.add('collapsed');
  } else {
    sidebar.classList.remove('collapsed');
  }
}
window.addEventListener('resize', handleResize);
handleResize();
