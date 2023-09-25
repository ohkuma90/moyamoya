function talk() {
  const form = document.getElementById('form');
  const robotComment = document.getElementById("robot-comment");
  const originalText = robotComment.querySelector("p").innerHTML;
  robotComment.querySelector("p").style.display = "none";
  form.addEventListener("submit", (e) => {
    e.preventDefault(); 

    const outputElement = document.createElement("p");
    robotComment.appendChild(outputElement);
    
    const text = originalText.split("<br>");

    let lineIndex = 0;
    let charIndex = 0;

    function displayText() {
      if (lineIndex < text.length) {
        const currentLine = text[lineIndex];

        if (charIndex < currentLine.length) {
          outputElement.innerHTML += currentLine.charAt(charIndex);
          charIndex++;
        } else {
          outputElement.innerHTML += "<br>";
          lineIndex++;
          charIndex = 0;
        }

        setTimeout(displayText, 200);
      } else {
        form.submit();
      }
    }
    displayText();
  });
}

window.addEventListener('turbo:load', talk);