import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/dist/sweetalert2.min.css'

const initDeleteButtons = () => {
  const links = document.querySelectorAll('.hidden-bin');
  const authToken = document.querySelector('meta[name="csrf-token"]').content;

  links.forEach(link => {
    link.addEventListener('click', (event) => {
      event.stopPropagation();
      event.preventDefault();

      Swal.fire({
        title: 'Are you sure?',
        text: link.dataset.confirm,
        icon: 'warning',
        confirmButtonText: 'Delete',
        showCancelButton: true,
      }).then(result => {
        if (result.isConfirmed) {
          fetch(link.href, {
            method: link.dataset.method,
            headers: {
              'X-CSRF-Token': authToken
            }
          }).then(() => {});
          link.parentElement.classList.add('card-fade');
      });
    });
  });
}

export { initDeleteButtons };
