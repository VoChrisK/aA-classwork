
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  const pEl = document.createElement("p");
  pEl.innerHTML = string;
  htmlElement.appendChild(pEl);
};

htmlGenerator('Party Time.', partyHeader);