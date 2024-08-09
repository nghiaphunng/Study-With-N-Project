function processText(inputText) {
	var linkRegex = /((http|https):\/\/[^\s]+)/g;
	var linkedText = inputText.replace(linkRegex, '<a href="$1" target="_blank">$1</a>');
	var processedText = linkedText.replace(/\n/g, '<br>');	
	return processedText;
}
function processTextNewLine(inputText){
	inputText = inputText.replace(/\n/g, ' ');	
	return inputText;
}