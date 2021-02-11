$(document).ready(function() {

  // typing animation
  (function($) {
    $.fn.writeText = function(content) {
        var contentArray = content.split(""),
            current = 0,
            elem = this;
        setInterval(function() {
            if(current < contentArray.length) {
                elem.text(elem.text() + contentArray[current++]);
            }
        }, 80);
    };
    
  })(jQuery);

  // input text for typing animation 
  $("#holder").writeText("STUDENT + ANDROID DEVELOPER");

  // initialize wow.js
  new WOW().init();
    
  // Push the body and the nav over by 285px over
  var main = function() {
    $('.fa-bars').click(function() {
      $('.nav-screen').animate({
        right: "0px"
      }, 200);

      $('body').animate({
        right: "285px"
      }, 200);
    });

    // Then push them back */
    $('.fa-times').click(function() {
      $('.nav-screen').animate({
        right: "-285px"
      }, 200);

      $('body').animate({
        right: "0px"
      }, 200);
    });

    $('.nav-links a').click(function() {
      $('.nav-screen').animate({
        right: "-285px"
      }, 500);

      $('body').animate({
        right: "0px"
      }, 500);
    });
  };

  $(document).ready(main);
  
  // initiate full page scroll

  $('#fullpage').fullpage({
    scrollBar: true,
    responsiveWidth: 400,
    navigation: true,
    navigationTooltips: ['home', 'about', 'projects', 'contact', 'connect'],
    anchors: ['home', 'about', 'projects', 'contact', 'connect'],
    menu: '#myMenu',
    fitToSection: false,

    afterLoad: function ( anchorLink, index){
      var loadedSection = $(this);


      //using index
      if(index==1){
        /* add opacity to arrow */
        $('.fa-chevron-down').each(function(){
          $(this).css('opacity','1')
        });
        $('.header-links a').each(function(){
          $(this).css('color','white')
        });
      }

      else if(index!=1){
        $('.header-links a').each(function(){
          $(this).css('color','black')
        });
      }

      //using index
      if(index == 2){

        /* animate skill bars */
        $('.skillbar').each(function(){
          $(this).find('.skillbar-bar').animate({
            width:jQuery(this).attr('data-percent')
          },2500);
        });
      }
    }
  });
 

  // move section down one
  $(document).on('click', '#moveDown', function(){
    $.fn.fullpage.moveSectionDown();
  });

  // fullpage.js link navigation
  $(document).on('click', '#skills', function(){
    $.fn.fullpage.moveTo(2);
  });

  $(document).on('click', '#projects', function(){
    $.fn.fullpage.moveTo(3);
  });

  $(document).on('click', '#contact', function(){
    $.fn.fullpage.moveTo(4);
  });

  // smooth scrolling
  $(function() {
    $('a[href*=#]:not([href=#])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
          $('html,body').animate({
            scrollTop: target.offset().top
          }, 700);
          return false;
        }
      }
    });
  });

  //ajax form
  $(function() {

    // Get the form.
    var form = $('#ajax-contact');

    // Get the messages div.
    var formMessages = $('#form-messages');

    // Set up an event listener for the contact form.
    $(form).submit(function(e) {
      // Stop the browser from submitting the form.
      e.preventDefault();

      // Serialize the form data.
      var formData = $(form).serialize();

      // Submit the form using AJAX.
      $.ajax({
        type: 'POST',
        url: $(form).attr('action'),
        data: formData
      })
      .done(function(response) {
        // Make sure that the formMessages div has the 'success' class.
        $(formMessages).removeClass('error');
        $(formMessages).addClass('success');

        // Set the message text.
        $(formMessages).text(response);

        // Clear the form.
        $('#name').val('');
        $('#email').val('');
        $('#message').val('');
      })
      .fail(function(data) {
        // Make sure that the formMessages div has the 'error' class.
        $(formMessages).removeClass('success');
        $(formMessages).addClass('error');

        // Set the message text.
        if (data.responseText !== '') {
          $(formMessages).text(data.responseText);
        } else {
          $(formMessages).text('Oops! An error occured and your message could not be sent.');
        }
      });
    });

  });

});

//slider
      const slider = document.querySelector(".slider")
// All trails 
const trail = document.querySelector(".trail").querySelectorAll("div")

// Transform value
let value = 0
// trail index number
let trailValue = 0
// interval (Duration)
let interval = 4000

// Function to slide forward
const slide = (condition) => {
    // CLear interval
    clearInterval(start)
    // update value and trailValue
    condition === "increase" ? initiateINC() : initiateDEC()
    // move slide
    move(value, trailValue)
    // Restart Animation
    animate()
    // start interal for slides back 
    start = setInterval(() => slide("increase"), interval);
}

// function for increase(forward, next) configuration
const initiateINC = () => {
    // Remove active from all trails
    trail.forEach(cur => cur.classList.remove("active"))
    // increase transform value
    value === 80 ? value = 0 : value += 20
    // update trailValue based on value
    trailUpdate()
}

// function for decrease(backward, previous) configuration
const initiateDEC = () => {
     // Remove active from all trails
    trail.forEach(cur => cur.classList.remove("active"))
    // decrease transform value
    value === 0 ? value = 80 : value -= 20
     // update trailValue based on value
    trailUpdate()
}

// function to transform slide 
const move = (S, T) => {
    // transform slider
    slider.style.transform = `translateX(-${S}%)`
    //add active class to the current trail
    trail[T].classList.add("active")
}

const tl = gsap.timeline({defaults: {duration: 0.6, ease: "power2.inOut"}})
tl.from(".bg", {x: "-100%", opacity: 0})
  .from("p", {opacity: 0}, "-=0.3")
  .from("h1", {opacity: 0, y: "30px"}, "-=0.3")
  .from("button", {opacity: 0, y: "-40px"}, "-=0.8")

// function to restart animation
const animate = () => tl.restart()

// function to update trailValue based on slide value
const trailUpdate = () => {
    if (value === 0) {
        trailValue = 0
    } else if (value === 20) {
        trailValue = 1
    } else if (value === 40) {
        trailValue = 2
    } else if (value === 60) {
        trailValue = 3
    } else {
        trailValue = 4
    }
}   

// Start interval for slides
let start = setInterval(() => slide("increase"), interval)

// Next  and  Previous button function (SVG icon with different classes)
document.querySelectorAll("svg").forEach(cur => {
    // Assign function based on the class Name("next" and "prev")
    cur.addEventListener("click", () => cur.classList.contains("next") ? slide("increase") : slide("decrease"))
})

// function to slide when trail is clicked
const clickCheck = (e) => {
    // CLear interval
    clearInterval(start)
    // remove active class from all trails
    trail.forEach(cur => cur.classList.remove("active"))
    // Get selected trail
    const check = e.target
    // add active class
    check.classList.add("active")

    // Update slide value based on the selected trail
    if(check.classList.contains("box1")) {
        value = 0
    } else if (check.classList.contains("box2")) {
        value = 20
    } else if (check.classList.contains("box3")) {
        value = 40
    } else if (check.classList.contains("box4")) {
        value = 60
    } else {
        value = 80
    }
    // update trail based on value
    trailUpdate()
    // transfrom slide
    move(value, trailValue)
    // start animation
    animate()
    // start interval
    start = setInterval(() => slide("increase"), interval)
}

// Add function to all trails
trail.forEach(cur => cur.addEventListener("click", (ev) => clickCheck(ev)))

// Mobile touch Slide Section
const touchSlide = (() => {
    let start, move, change, sliderWidth

    // Do this on initial touch on screen
    slider.addEventListener("touchstart", (e) => {
        // get the touche position of X on the screen
        start = e.touches[0].clientX
        // (each slide with) the width of the slider container divided by the number of slides
        sliderWidth = slider.clientWidth/trail.length
    })
    
    // Do this on touchDrag on screen
    slider.addEventListener("touchmove", (e) => {
        // prevent default function
        e.preventDefault()
        // get the touche position of X on the screen when dragging stops
        move = e.touches[0].clientX
        // Subtract initial position from end position and save to change variabla
        change = start - move
    })

    const mobile = (e) => {
        // if change is greater than a quarter of sliderWidth, next else Do NOTHING
        change > (sliderWidth/4)  ? slide("increase") : null;
        // if change * -1 is greater than a quarter of sliderWidth, prev else Do NOTHING
        (change * -1) > (sliderWidth/4) ? slide("decrease") : null;
        // reset all variable to 0
        [start, move, change, sliderWidth] = [0,0,0,0]
    }
    // call mobile on touch end
    slider.addEventListener("touchend", mobile)
})()
