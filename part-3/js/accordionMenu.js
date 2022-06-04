const arrowIcons = document.querySelectorAll(".section-heading__icon");
const sectionContainers = document.querySelectorAll(".section-container");

for(let i = 0; i < arrowIcons.length; i++){
  arrowIcons[i].addEventListener('click', () => {
    sectionContainers[i].style.transition = "all 0.3s";
    sectionContainers[i].classList.toggle("opened");
    if (sectionContainers[i].classList.contains("opened")){
			arrowIcons[i].style.transform = "rotate(180deg)";
    } else {
			arrowIcons[i].style.transform = "rotate(0)";
    }
    arrowIcons[i].style.transition = "all 0.3s";
    
  });
}