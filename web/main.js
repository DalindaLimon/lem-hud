window.addEventListener('message', function(event){
    const data = event.data;
    /* console.log(a); */
    const helt = document.getElementById("kalp-yuzde");
    const heltyuzde = String((data.health)+'%') 
    helt.style.width = heltyuzde;
    armor(data)
    stamina(data)
    hunger(data)
    thirst(data)
});
function buttonsize(buttonid,todo){
    buttonid = String(buttonid)
    const element = document.getElementById(buttonid)
    const elementst = element.style
    console.log(elementst)
    const elementHeight = elementst.height
    if(todo === 'Bigger'){
        elementst.width = elementWidth +10 +'%'
    }

}


function armor(data){
    const armorbox = document.getElementById('zirh')
    const armor = document.getElementById('zirh-yuzde')
    const armoryuzde = String((data.armor)+"%")
    if ( parseInt(armoryuzde)<1 ){
     armorbox.style.display = 'none'
 }
 else{
  armorbox.style.display = 'block'
 armor.style.width = armoryuzde 
 }
}


function stamina(data){
    const staminabox = document.getElementById('staminabox')
    const stamina = document.getElementById('stamina')
    const staminayuzde = String((data.stamina)+"%")
    if (parseInt(staminayuzde) > 90){
        staminabox.style.display = 'none'
        
    }
    else{
        staminabox.style.display = 'block'
        stamina.style.width = staminayuzde
    }
}
function hunger(data){
    const hungerbox = document.getElementById("hunger") ;
    const hunger = document.getElementById("hunger-percent");
    const hungerpercent = String((data.hunger)+"%");
    hunger.style.width = hungerpercent;
};
function thirst(data){
    const thirstbox = document.getElementById("thirst");
    const thirst = document.getElementById("thirst-percent");
    const thirstpercent = String((data.thirst)+"%");
    thirst.style.width = thirstpercent;

}