#include <sys/time.h>
#include <stdlib.h>
#include <stdio.h>


#ifndef MAX_TAILLE_DATA_KO
#define MAX_TAILLE_DATA_KO 41000 // Replace 1024 with your default value
#endif

#ifndef REPETITIONS
#define REPETITIONS 10
#endif

#define CACHE_LINE_SIZE 64
int tab[(MAX_TAILLE_DATA_KO * 1024)/sizeof(int)];
int i;
int j;
int taille_data;
int nbdonnee;
struct timeval t1, t2;
int pas= CACHE_LINE_SIZE /sizeof(int);
float temps_acces_moyen;
int nbrepetition = REPETITIONS;

int main() 
{
    int cls=CACHE_LINE_SIZE;
    int x;


    for (taille_data=cls; taille_data <= MAX_TAILLE_DATA_KO * 1024; taille_data=taille_data+cls){
        nbdonnee= (taille_data) / sizeof(int);

        for (i=0; i < nbdonnee ; i=i+pas) { 
            x=x+tab[i];
        } 
        
        gettimeofday(&t1, NULL);
        for (j=0; j < nbrepetition; j++) 
            for (i=0; i < nbdonnee ; i=i+pas) x=x+tab[i];
            
        gettimeofday(&t2, NULL);
        temps_acces_moyen= (float) ((t2.tv_sec - t1.tv_sec) *1000000 + t2.tv_usec - t1.tv_usec)/ ((nbdonnee /pas) * nbrepetition);
        printf("%f, %d\n", temps_acces_moyen, taille_data);
    }
    return 0;
}
