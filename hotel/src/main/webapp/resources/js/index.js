import MainSlide from './MainSlide.js';

const mainSlider = new MainSlide();

$(document).ready(function(){

let lastScroll = 0;
    $(window).on('scroll',function(){
        let scrollTop = $(this).scrollTop();
        let header = $(".header")
        if(scrollTop > lastScroll){
            $(".header").attr("class","header scrolled")
        }else if(scrollTop == lastScroll){
            $(".header").attr("class","header scrolltop")
        }
    })
})


