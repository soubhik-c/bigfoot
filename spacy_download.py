import spacy

spacy_model_name = [ 'en_core_web_lg', 'en_core_web_sm' ]
for smn in spacy_model_name:
	if not spacy.util.is_package(smn):
	    spacy.cli.download(smn)

