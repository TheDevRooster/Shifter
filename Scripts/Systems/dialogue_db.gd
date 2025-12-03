extends Node

var just_opened =false
var Dialogue_active = false
var Dialogue = {
	'Scientist': {
		'Intro': {
			'speaker': 'Scientist',
			'text': "Hello experiment 4x4332.",
			'next_text': 'Intro2',
		},
		'Intro2': {
			'speaker': "Scientist",
			'text': "Please Proceed to the ORANGE terminal to configure your experiment.",
			'next_text': null,
		},
		'Intro3': {
			'speaker': 'Scientist',
			'text': "Good. Now please proceed to chamber 1 for your first trial. You will find the entrance up top. Good Luck.",
			'next_text': null,
		},
		'Intro4': {
			'speaker': 'Scientist',
			'text': 'Please proceed with the experiment 4x4332. We will proceed with 4x4333 if you do not cooperate.',
			'next_text': null,
		},
		'Middle1': {
			'speaker': 'Scientist',
			'text': 'Congratulations on completing the first trial. Plese head down to RNAPC next to the ORANGE console to collect your reward.',
			'next_text': null
		}
}
}
