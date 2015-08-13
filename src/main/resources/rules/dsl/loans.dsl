[condition][]the lender is "{mortgage_company}"=mortgage:Mortgage(lender:lenderName == "{mortgage_company}",product:mortgageName)
[condition][]and there is an application=application:LoanApplication(lenders contains lender)
[condition][]- with a FICO score below {score}=ficoScore < {score}
[condition][]- with a Principal that is less than {loanPrincipal}=principal < {loanPrincipal}
[condition][]- with a Number of Units greater than {maxUnits}=numberOfUnits > {maxUnits}
[condition][]- with a Number of Units equal to {reqdUnits}=numberOfUnits == {reqdUnits}
[condition][]- with a Principal that is equal or greater than {maxPrincipal}=principal >= {maxPrincipal}
[condition][]- with a Principal that is not a multiple of {multiple}=eval(principal % {multiple} != 0)
[condition][]- with a Loan Purpose that is not one of \[{purposeList}\]=loanPurpose not in ( {purposeList} )
[condition][]- with a Property Type of "{type}"=propertyType == "{type}"
[condition][]- with a Principal that is equal or more than {princPercent}% of the Property Value
                =principal >= propertyValue * ({princPercent}/100.0)
[condition][]- with an applicant that is younger that {minAge} years of age
                =yearsOfAge(applicant.dateOfBirth) < {minAge}
[condition][]- with an applicant that is not a resident=!applicant.resident
[condition][]- with an applicant that is an employee of the lender=applicant.employer == lender
[consequence][]reject the application because "{message}"=application.addMessage("Declined by " + lender + " because {message}");
[consequence][]failed to prequalify the application because "{message}"=application.addMessage("Declined by " + lender + " because {message}"); application.setPrequalified(false);update(application);
[consequence][]recommend "{message}"=application.addMessage("Lender " + lender + " recommends {message}");
