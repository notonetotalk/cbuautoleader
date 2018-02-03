import 'dart:html';

Map codeTree;
String tree;

void main() {

	changeCodeTree();
	querySelector("#add0").onClick.listen(add0);
	querySelector("#add1").onClick.listen(add1);
	querySelector("#add2").onClick.listen(add2);
	querySelector("#reset").onClick.listen(reset);
	querySelector("#radioThraxis").onChange.listen(changeCodeTree);
	querySelector("#radioMadisons").onChange.listen(changeCodeTree);

}

void changeCodeTree([Event event]) {

	if ((querySelector("#radioMadisons") as RadioButtonInputElement).checked) {
	
		codeTree = {"": "AAA", "0": "BBB", "00": "CCC", "01": "ABC", "010": "CCB", "011": "BCC", "012": "CBC", "02": "ABC", "020": "BCB", "021": "CBB", "022": "BBC", "1": "ABC", "10": "BAB", "100": "CCA", "101": "BCA", "102": "CAB", "11": "BBA", "110": "ACB, or CAC if not.", "1100": "CAC", "111": "BAC", "112": "CBA", "12": "ABB, or ACC if not.", "121": "ACC", "2": "ABC", "20": "BAA, or CAA if not.", "202": "CAA", "21": "AAB, or ACA if not.", "211": "ACA", "22": "ABA, or AAC if not.", "221": "AAC"};
	
	} else {
	
		codeTree = {"": "AAA", "0": "BBB", "00": "CCC", "01": "BCC, and try CBC if not.", "011": "CBC, or CCB if not.", "0111": "CCB", "02": "BBC, and try BCB if not.", "021": "BCB, or CBB if not.", "0211": "CBB", "1": "BBB", "10": "ACC, and try CAC if not.", "101": "CAC, or CCA if not.", "1011": "CCA", "11": "ABC", "110": "BCA, or CAB if not.", "1100": "CAB", "111": "ACB, and try CBA if not.", "1110": "CBA, or BAC if not.", "11100": "BAC", "12": "ABB, and try BAB of not.", "121": "BAB, or BBA if not.", "1211": "BBA", "2": "AAB", "21": "ABA", "211": "BAA, or CAA if not.", "2112": "CAA", "212": "ACA", "22": "AAC"};
	
	}
	reset();

}

void reset([MouseEvent event]) {

	tree = "";
	pushOutput(codeTree[tree]);

}

void pushOutput(String code) {

	final codeOutput = querySelector("#codeOutput");
	codeOutput.value = code;
	if ((querySelector("#checkCopy") as InputElement).checked) {
	
		codeOutput.select();
		document.execCommand("copy");
	
	}

}

void add0(MouseEvent event) {

	tree = tree + "0";
	pushOutput(codeTree[tree]);

}

void add1(MouseEvent event) {

	tree = tree + "1";
	pushOutput(codeTree[tree]);

}

void add2(MouseEvent event) {

	tree = tree + "2";
	pushOutput(codeTree[tree]);

}
