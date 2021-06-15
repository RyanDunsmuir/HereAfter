
import Turbolinks from 'turbolinks';

const countdownTimer = () => {
  let capsules = document.querySelectorAll('#countdown');

  function renderTimer(capsuleCard){
    var countDownDate = new Date(capsuleCard.dataset.arrival).getTime();
    // var countDownDate = document.getElementById("arrival_date").value;
    // Update the count down every 1 second
    var x = setInterval(function() {

      // Get today's date and time
      var now = new Date().getTime();

      // Find the distance between now and the count down date
      var distance = Math.max(countDownDate - now, 0);

      // Time calculations for days, hours, minutes and seconds
      var years = Math.floor(distance / (1000 * 60 * 60 * 24 * 365.25));
      var days = Math.floor((distance % (1000 * 60 * 60 * 24 * 365.25)) / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);

      // If the count down is finished, write some text
      if (distance <= 0) {
        clearInterval(x);
        Turbolinks.clearCache()
        Turbolinks.visit("/inbox", {"action":"replace"})
      }

      // Display the result in the element with id="countdown"
      if (years > 1) {
        capsuleCard.innerHTML = years + "y "  + days + "d " + hours + "h ";
      } else if (years > 0) {
        capsuleCard.innerHTML = years + "y " + days + "d " + hours + "h ";
      } else if (days > 0) {
        capsuleCard.innerHTML = days + "d " + hours + "h " + minutes + "m ";
      } else if (hours > 0) {
        capsuleCard.innerHTML = hours + "h " + minutes + "m " + seconds + "s ";
      } else if (minutes > 0) {
        capsuleCard.innerHTML = minutes + "m " + seconds + "s ";
      } else if (seconds > 0) {
        capsuleCard.innerHTML = seconds + "s ";
      }

      //       if (years > 1) {
      //   capsuleCard.innerHTML = years + " Years";
      // } else if (years > 0) {
      //   capsuleCard.innerHTML = years + " Year and " + days + " Days ";
      // } else if (days > 0) {
      //   capsuleCard.innerHTML = days + " Days and " + hours + " Hours ";
      // } else if (hours > 0) {
      //   capsuleCard.innerHTML = hours + " Hours, " + minutes + " Minutes and " + seconds + " Seconds ";
      // } else if (minutes > 0) {
      //   capsuleCard.innerHTML = minutes + " Minutes and " + seconds + " Seconds ";
      // } else if (seconds > 0) {
      //   capsuleCard.innerHTML = seconds + " Seconds ";
      // }


    }, 1000);
  }

  capsules.forEach(renderTimer);

}

export { countdownTimer }
