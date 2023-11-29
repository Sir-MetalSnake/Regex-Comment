%{
#include <stdio.h>
%}

COMENTARIOLINEA #.*\n
COMENTARIOMULT \/\*([^*]|\*+[^*/])*\*+\/

%%

{COMENTARIOLINEA} {
    //printf("Comentario de línea: %s\n", yytext);
}

{COMENTARIOMULT} {
    //printf("Comentario multilineal: %s\n", yytext);
}

.|\n {
    /* Acción para cualquier otro carácter o nueva línea según sea necesario */
    printf("%s", yytext);
}

%%

int main() {
	FILE *archivo;//Declaramos una variable puntero de tipo archivo
    archivo = fopen("Prueba.txt", "r");
    yyin = archivo; //archivo de entrada

    yylex(); //Se analiza la gramatica dentro del txt

    fclose(archivo); 
	printf("\n Lectura de Archivo con exito!!!!\n");
    return 0;
}

