function talk() {
  const robotComment = document.getElementById("my-robot-comment");
  const originalText = robotComment.querySelector("p").innerHTML;
  robotComment.querySelector("p").style.display = "none";

    const outputElement = document.createElement("p");
    robotComment.appendChild(outputElement);
    
    const text = originalText.split("<br>");

    let lineIndex = 0;
    let charIndex = 0;

    function displayText() {
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
    }
    displayText();
  };

window.addEventListener('turbo:load', talk);