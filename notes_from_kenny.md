Notes from Kenny

There are a few things I didn't do in this sample code problem I would have done if this code was meant for production:

1. ERROR checking! Especially in web-based applications, need to make sure someone doesn't enter garbage. Examples:
	* Negative amounts & interest rates
	* Strings where dates or numbers are expected

2. I coding this for doing calculations based on one month pay cycle. Anything in the real world would obviously go farther out. 
	* Only big change I'd need for this is not hard-coding "end_date = 30" all over this thing
	* No minimum balance due.
	* Dates should be based on actual date instead of day 0 = loan start date and day 30 = payment due date

3. Add checks to make sure the customer is not going over their credit limit.

