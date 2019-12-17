
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {
  let listOfDogs = [];
  Object.keys(dogs).forEach((dog) => {
    let aEl = document.createElement("a");
    aEl.innerHTML = dog;
    aEl.setAttribute("href", dogs[dog]);
    let liEl = document.createElement("li");
    liEl.setAttribute("class", "dog-link");
    liEl.appendChild(aEl);
    listOfDogs.push(liEl);
  });

  return listOfDogs;
}

function attachDogLinks() {
  let dogLinks = dogLinkCreator();
  let ulEl = document.getElementsByClassName("drop-down-dog-list");
  dogLinks.forEach(link => {
    link.style.visibility = "hidden";
    ulEl[0].appendChild(link);
  });
  handleEnter();
}

function handleEnter() {
  let dogLinks = document.getElementsByClassName("dog-link");
    document.getElementsByClassName("drop-down-dog-nav")[0].addEventListener("mouseenter", event => {
      for (let i = 0; i < dogLinks.length; i++) {
          dogLinks[i].style.visibility = "visible";
      }
    });
}

function handleLeave() {
  let dogLinks = document.getElementsByClassName("dog-link");
  document.getElementsByClassName("drop-down-dog-nav")[0].addEventListener("mouseleave", event => {
    for (let i = 0; i < dogLinks.length; i++) {
      dogLinks[i].style.visibility = "hidden";
    }
  });
}

attachDogLinks();
handleEnter();
handleLeave();

export default attachDogLinks;