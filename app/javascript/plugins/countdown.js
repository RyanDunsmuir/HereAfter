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
      var distance = countDownDate - now;

      // Time calculations for days, hours, minutes and seconds
      var years = Math.floor(distance / (1000 * 60 * 60 * 24 * 365.25));
      var days = Math.floor((distance % (1000 * 60 * 60 * 24 * 365.25)) / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);

      // Display the result in the element with id="countdown"
      capsuleCard.innerHTML = years + "y " + days + "d " + hours + "h "
      + minutes + "m " + seconds + "s ";

      // If the count down is finished, write some text
      if (distance < 0) {
        clearInterval(x);
        CapsuleCard.innerHTML = "ARRIVED";
      }
    }, 1000);
  }

  capsules.forEach(renderTimer);

}

export { countdownTimer }
