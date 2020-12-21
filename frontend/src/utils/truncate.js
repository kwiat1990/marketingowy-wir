export default function truncateBySentence(text, sentenceCount = 6) {
  // match ".","!","?" - english ending sentence punctuation
  const sentences = text.match(/["’]?[A-Z][^.?!]+((?![.?!][’"]?\s["’]?[A-Z][^.?!]).)+[.?!’"]+/g);
  const MAX_CHAR_NUM_TO_SHOW = 350;

  if (sentences && sentences?.length >= sentenceCount) {
    const turncatedText = sentences.slice(0, sentenceCount).join(" ");
  
    return turncatedText.length > MAX_CHAR_NUM_TO_SHOW
      ? `${turncatedText.slice(0, 350)}...`
      : turncatedText;
  }

  return text;
}
