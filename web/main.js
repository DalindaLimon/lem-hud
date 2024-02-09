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
    speedemeter(data)
    IsinVehicle(data)
    /* oxygen(data) */
    seatbelt(data)
    vehiclerpm(data)
    
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

function IsinVehicle(data) {
    const gosterge = document.getElementById("gosterge")
   
    if(data.IsinVehicle){
        gosterge.style.display = "block";
        
    }
    else{
        gosterge.style.display = "none";
        
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
    
    if (data.stamina > 95){
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
/* function oxygen(data){
    const oxygenbox = document.getElementById('oxygenbox')
    const oxygen = document.getElementById('oxygen')
    const oxygenyuzde = String((data.oxygen)+"%")
    
    
    if (data.oxygen > 95){
        oxygenbox.style.display = 'none'
        
    }
    else{
        oxygenbox.style.display = 'block'
        oxygen.style.width = oxygenyuzde
    }
} */

function speedemeter(data,){
    const spid = document.getElementById('speedemeter');
    const stick = document.getElementById('stick')
    const vehiclespeed = Math.floor(data.vehiclespeed);
    spid.innerHTML = vehiclespeed ;
   /*  stick.style.rotate = String((data.vehiclerpm*120+"deg")) */

}
function vehiclerpm(data){
    const stick = document.getElementById("rpm-stick");
    const rotate = String(data.vehiclerpm*139+"deg")
    stick.style.rotate = rotate
}
function seatbelt(data){
    const seatbelt = document.getElementById('seatbelt-ic')
    if(data.seatbelt){
        seatbelt.innerHTML = 'add_link'
        seatbelt.style.color = "white"
    }
    else{
        seatbelt.innerHTML = 'link_off'
        seatbelt.style.color = "red"
    }
}
