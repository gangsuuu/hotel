export default class mainSlider{
#MainslidePosition = 1;
#MainSlideCount = 0;
#IntervalAuto
#autoplay = true;
#showMenuList = false;
menuContainerEl
menuListEl
mainAddEl
mainIndcatorWrapEl
mainControlWrapEl

constructor(){
this.assignElement();
this.initSlideCount();
this.creatMainIndcator();
this.addEvent();
this.initAutoplay();
}

assignElement(){
    this.mainAddEl = document.getElementById('main_list');
    this.mainIndcatorWrapEl = document.querySelector('#main_indcator_wrap');
    this.mainControlWrapEl = document.querySelector('#main_btn_control');
    this.menuContainerEl = document.getElementById('menu_container');
    this.menuListEl = document.getElementById('menu_list');
}

initSlideCount() {
    this.#MainSlideCount = document.querySelectorAll('.main_list_content').length;
}

creatMainIndcator(){
    const docFragment = document.createDocumentFragment();
    for (let i = 0; i < this.#MainSlideCount; i += 1){
        const li = document.createElement('li');
        const outdiv = document.createElement('div')
        const innerdiv = document.createElement('div')

        outdiv.classList.add('main_out_btn');
        
        if(i == 0){
            outdiv.classList.add('main_choice');
        }
        
        innerdiv.classList.add('main_inner_btn');

        innerdiv.dataset.main_num = i+1;
        outdiv.appendChild(innerdiv);
        li.appendChild(outdiv);
        docFragment.appendChild(li);
    }
    this.mainIndcatorWrapEl.querySelector('ul').appendChild(docFragment);
}

addEvent(){
    this.mainIndcatorWrapEl.addEventListener('click',this.changeIndcator.bind(this))
    this.mainControlWrapEl.addEventListener('click',this.togglePlay.bind(this))
    this.menuContainerEl.addEventListener('click',this.toggleMenu.bind(this))
}

changeIndcator(event){
    const indexPosition = parseInt(event.target.dataset.main_num, 10);
    //const name = event.target.classList
    if(Number.isInteger(indexPosition)){
        this.mainAddEl.querySelector('li.active')?.classList.remove('active');
        this.#MainslidePosition = indexPosition;
        this.moveindcator();
        this.mainAddEl.querySelector(`li:nth-child(${indexPosition})`).classList.add('active');
        if(this.#autoplay){
        clearInterval(this.#IntervalAuto);
        this.initAutoplay();
        }
    }
}

togglePlay(event){
    if(event.target.dataset.status === 'play'){
        this.#autoplay = true;
        this.mainControlWrapEl.classList.add('play');
        this.mainControlWrapEl.classList.remove('pause');
        this.initAutoplay();
    }else if(event.target.dataset.status === 'pause'){
        this.#autoplay = false;
        this.mainControlWrapEl.classList.add('pause');
        this.mainControlWrapEl.classList.remove('play');
        clearInterval(this.#IntervalAuto);
    }
}

initAutoplay(){
    this.#MainslidePosition += 1;
    this.#IntervalAuto = setInterval(this.moveToRight.bind(this),10000);
}
moveToRight(){
    this.mainAddEl.querySelector('li.active')?.classList.remove('active');
    if(this.#MainslidePosition > this.#MainSlideCount){
        this.#MainslidePosition = 1;
        this.moveindcator();
        this.mainAddEl.querySelector(`li:nth-child(${this.#MainslidePosition})`).classList.add('active');
        this.#MainslidePosition += 1;
    }else{
        this.mainAddEl.querySelector(`li:nth-child(${this.#MainslidePosition})`).classList.add('active');
        this.moveindcator();
        this.#MainslidePosition += 1;
    }
}
moveindcator(){
    this.mainIndcatorWrapEl.querySelector('li div.main_unchoice')?.classList.remove('main_unchoice');
    this.mainIndcatorWrapEl.querySelector('li div.main_choice')?.classList.add('main_unchoice');
    this.mainIndcatorWrapEl.querySelector('li div.main_choice')?.classList.remove('main_choice');
    this.mainIndcatorWrapEl.querySelector(`li:nth-child(${this.#MainslidePosition})>div`).classList.add('main_choice');
}


toggleMenu(){
    
    let span = this.menuListEl.querySelectorAll('span');
    let div = this.menuListEl.querySelectorAll('div');
    if(!this.#showMenuList){
        this.menuContainerEl.classList.add('menu_container_active');
        setTimeout(() =>this.moveMenuBar(),230);
        var i = 0;
        while(!this.#showMenuList){
            if(i < span.length){
                
                //i = setTimeout(() => this.showMenuList(i),2000);
                span[i].classList.remove('hide');
                span[i].classList.add('show_menu_list');
                i++;
            }else{
                //alert(i);
            this.#showMenuList = true;
            }
        }
    }else{



    }
        //span[i].classList.remove('hide');
        //span[i].classList.add('show_menu_list');
    
    for(var j = 0; j <div.length; j++){
        div[j].classList.remove('hide');
        div[j].classList.add('show_menu_bar');
    }    
    
}



moveMenuBar(){
    this.menuContainerEl.querySelector('#bar_2').classList.add('bar_2_active')
}


showMenuList(i){
    alert(i);
    return i++;
}


}