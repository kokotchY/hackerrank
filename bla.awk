{
	avg = ($2 + $3 + $4) / 3;
	if (avg >= 80) {
		print $0 " : A"
	} else if (avg >= 60 && avg < 80) {
		print $0 " : B"
	} else if (avg >= 50 && avg < 60) {
		print $0 " : C"
	} else {
		print $0 " : FAIL"
	}
}
