import sys

sys.path.insert(0, "package/")

import logging
import spacy

log = logging.getLogger()
log.setLevel(logging.INFO)


def lambda_handler(event, context) -> str:
    """
    rounds value

    event
    - text: A text to be analyzed

    """

    text = event["data"]

    if isinstance(text, str):
        try:
            text = _get_text_analysis(text)
            return text

        except Exception as e:
            raise e

    else:
        return False


def _get_text_analysis(text: str) -> list:
    nlp = spacy.load("en_core_web_md")
    doc = nlp(text)
    sents = doc.sents
    text_analysis = [
        {"text": sent.text, "entities": {ent.text: ent.label_ for ent in sent.ents}}
        for sent in sents
    ]
    return text_analysis
