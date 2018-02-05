import 'dart:html';

// Initalize key/value pairs for where we are on a branch, and the corresponding code.
final Map codeTreeT = {"": "AAA", "0": "BBB", "00": "CCC", "01": "BCC, or if not, try CBC.", "011": "CBC, or if not, CCB.", "0111": "CCB", "02": "BBC, or if not, try BCB.", "021": "BCB, or if not, CBB.", "0211": "CBB", "1": "BBB", "10": "ACC, or if not, try CAC.", "101": "CAC, or if not, CCA.", "1011": "CCA", "11": "ABC", "110": "BCA, or if not, CAB.", "1100": "CAB", "111": "ACB, or if not, try CBA.", "1110": "CBA, or if not, BAC.", "11100": "BAC", "12": "ABB, or if not, try BAB.", "121": "BAB, or if not, BBA.", "1211": "BBA", "2": "AAB", "21": "ABA", "211": "BAA, or if not, CAA.", "2112": "CAA", "212": "ACA", "22": "AAC"};
final Map codeTreeM = {"": "AAA", "0": "BBB", "00": "CCC", "01": "ABC", "010": "CCB", "011": "BCC", "012": "CBC", "02": "ABC", "020": "BCB", "021": "CBB", "022": "BBC", "1": "ABC", "10": "BAB", "100": "CCA", "101": "BCA", "102": "CAB", "11": "BBA", "110": "ACB, or if not, CAC.", "1100": "CAC", "111": "BAC", "112": "CBA", "12": "ABB, or if not, ACC.", "121": "ACC", "2": "ABC", "20": "BAA, or if not, CAA.", "202": "CAA", "21": "AAB, or if not, ACA.", "211": "ACA", "22": "ABA, or if not, AAC.", "221": "AAC"};
final Map codeTreeChanceT = {"": "AAA (3.7%)", "0": "BBB (12.5%)", "00": "CCC (100%)", "01": "BCC (33.3%), or if not, try CBC.", "011": "CBC (50%), or if not, CCB.", "0111": "CCB (100%)", "02": "BBC (33.3%), or if not, try BCB.", "021": "BCB (50%), or if not, CBB.", "0211": "CBB (100%)", "1": "BBB (0%)", "10": "ACC (33.3%), or if not, try CAC.", "101": "CAC (50%), or if not, CCA.", "1011": "CCA (100%)", "11": "ABC (16.7%)", "110": "BCA (50%), or if not, CAB.", "1100": "CAB (100%)", "111": "ACB (33.3%), or if not, try CBA.", "1110": "CBA (50%), or if not, BAC.", "11100": "BAC (100%)", "12": "ABB (33.3%), or if not, try BAB.", "121": "BAB (50%), or if not, BBA.", "1211": "BBA (100%)", "2": "AAB (16.7%)", "21": "ABA (25%)", "211": "BAA (50%), or if not, CAA.", "2112": "CAA (100%)", "212": "ACA (100%)", "22": "AAC (100%)"};
final Map codeTreeChanceM = {"": "AAA (3.7%)", "0": "BBB (12.5%)", "00": "CCC (100%)", "01": "ABC (0%)", "010": "CCB (100%)", "011": "BCC (100%)", "012": "CBC (100%)", "02": "ABC (0%)", "020": "BCB (100%)", "021": "CBB (100%)", "022": "BBC (100%)", "1": "ABC (8.3%)", "10": "BAB (25%)", "100": "CCA (100%)", "101": "BCA (100%)", "102": "CAB (100%)", "11": "BBA (20%)", "110": "ACB (50%), or if not, CAC.", "1100": "CAC (100%)", "111": "BAC (100%)", "112": "CBA (100%)", "12": "ABB (50%), or if not, ACC.", "121": "ACC (100%)", "2": "ABC (0%)", "20": "BAA (50%), or if not, CAA.", "202": "CAA (100%)", "21": "AAB (50%), or if not, ACA.", "211": "ACA (100%)", "22": "ABA (50%), or if not, AAC.", "221": "AAC (100%)"};
Map codeTree;
String tree;

// Initalize program.
void main() {

	changeCodeTreeReset();
	querySelector("#add0").onClick.listen(moveNode);
	querySelector("#add1").onClick.listen(moveNode);
	querySelector("#add2").onClick.listen(moveNode);
	querySelector("#reset").onClick.listen(reset);
	querySelector("#radioThraxis").onChange.listen(changeCodeTreeReset);
	querySelector("#radioMadisons").onChange.listen(changeCodeTreeReset);
	querySelector("#checkCopy").onChange.listen(pushOutput);
	querySelector("#checkChance").onChange.listen(changeCodeTreeChance);

}

// Set the appropriate code tree to follow based on user selection.
void changeCodeTree([Event event]) {

	if ((querySelector("#radioMadisons") as RadioButtonInputElement).checked) {

		if ((querySelector("#checkChance") as CheckboxInputElement).checked) {

			codeTree = codeTreeChanceM;

		} else {

			codeTree = codeTreeM;

		}

	} else {

		if ((querySelector("#checkChance") as CheckboxInputElement).checked) {

			codeTree = codeTreeChanceT;

		} else {

			codeTree = codeTreeT;

		}

	}

}

// Updates the branch key/value pairs and resets the node position.
void changeCodeTreeReset([Event event]) {

	changeCodeTree();
	reset();

}

// Updates the key/value pairs and retains the current node position.
void changeCodeTreeChance(Event event) {

	changeCodeTree();
	pushOutput();

}

// Resets the node position.
void reset([MouseEvent event]) {

	tree = "";
	pushOutput();
	if (event != null) {(event.target as ButtonElement).classes.remove("pressed-reset-button");}
	print("-----Reset----");

}

// Move branch node position.
void moveNode(MouseEvent event) {

	final String buttonValue = (event.target as ButtonElement).value;
	tree = tree + buttonValue;
	pushOutput();
	print("Pressed ${buttonValue}");

}

// Output the code at the current branch node, and copies the output to clipboard if option is selected.
void pushOutput([Event event]) {

	final TextInputElement codeOutput = querySelector("#codeOutput");
	codeOutput.value = codeTree[tree];
	if ((querySelector("#checkCopy") as CheckboxInputElement).checked) {
	
		codeOutput.select();
		document.execCommand("copy");
	
	}
	updateButtonStyles();

}

// The following function updates the button styles for a visual indication of what options are available.
void updateButtonStyles() {

	if (codeTree[tree + "0"] == null) {

		(querySelector("#add0") as ButtonElement).disabled = true;

	} else {

		(querySelector("#add0") as ButtonElement).disabled = false;

	}
	if (codeTree[tree + "1"] == null) {

		(querySelector("#add1") as ButtonElement).disabled = true;

	} else {

		(querySelector("#add1") as ButtonElement).disabled = false;

	}
	if (codeTree[tree + "2"] == null) {

		(querySelector("#add2") as ButtonElement).disabled = true;

	} else {

		(querySelector("#add2") as ButtonElement).disabled = false;

	}

}
