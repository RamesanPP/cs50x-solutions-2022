#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <math.h>


int main(void)
{
    string str = get_string("Text: \n");
    int l = strlen(str);
    float word = 0, letter = 0, sentence = 0;
    if (isalnum(str[0]))
    {
        word = 1;

    }
    for (int i = 0; i < l; i++)
    {

        if (isalnum(str[i]))
        {
            letter++;
        }
        if (isspace(str[i]) && isalnum(str[i + 1]))
        {
            word++;
        }
        if (i > 0 && (str[i] == '!' || str[i] == '?' || str[i] == '.' || str[i] == '"' || str[i] == ':') && isalnum(str[i - 1]))
        {
            sentence++;
        }
    }
    int grade = round(0.0588 * (100 * letter / word) - 0.296 * (100 * sentence / word) - 15.8);

    if (grade < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (grade <= 16)
    {
        printf("Grade %i\n", grade);
    }
    else
    {
        printf("Grade 16+\n");
    }
}