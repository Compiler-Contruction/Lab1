/*** Definition Section has variables ***/
%{
int wordCount = 0;
int spaceCount = 0;
int vowelCount = 0;
int consonantCount = 0;
%}

/*** Rule Section ***/
%%

[a-zA-Z]+ {
   { printf("%s\n", yytext); wordCount++; }
    for (int i = 0; yytext[i]; i++) {
        if (yytext[i] == 'a' || yytext[i] == 'e' || yytext[i] == 'i' || yytext[i] == 'o' || yytext[i] == 'u' ||
            yytext[i] == 'A' || yytext[i] == 'E' || yytext[i] == 'I' || yytext[i] == 'O' || yytext[i] == 'U') {
            vowelCount++;
        }
        else{
            consonantCount++;
       }
    }
}

" " {
    spaceCount++;
}

\n {
    return 0;
}

. {
    // Ignore other characters
}

%%

/*** Code Section ***/
int main() {
    yylex();
    printf("\nNumber of Words: %d\n", wordCount);
    printf("Number of Spaces: %d\n", spaceCount);
    printf("Number of Vowels: %d\n", vowelCount);
    printf("Number of Consonants: %d\n", consonantCount);
    return 0;
}

int yylex(void); // Declare the yylex function.

int yywrap() {
    return 1; // Indicate that there are no more tokens to process.
}
