# TP_REST

## Contenu des scripts :

---
# HTTP

### allumer.sh :
 Permet d'allumer la prise de l'adresse .255.252
 
### eteindre.sh
  Permet d'éteindre la prise de l'adresse .255.252
  
### checkStates.sh
  Permet de vérifier l'état des prises : allumées ou éteintes.
  Le script peut prendre en argument **uniquement 0, 1 ou 2**
  
   - 0 : Permet de vérifier l'état des deux prises
   - 1 : Permet de vérifier l'état de la prise .255.252
   - 2 : Permet de vérifier l'état de la prise .255.253

# MQTT

### allumer_v2.sh :
 Permet d'allumer la prise
 
### eteindre_v2.sh
  Permet d'éteindre la prise
  
### checkStates_v2.sh
  Permet de vérifier l'état des prises : allumées ou éteintes.
  Le script peut prendre en argument **uniquement 0, 1 ou 2**
  
   - 0 : Permet de vérifier l'état des deux prises 
   - 1 : Permet de vérifier l'état de la prise 2
   - 2 : Permet de vérifier l'état de la prise 2
  Je ne peux allumer que la prise 2 car il n'y a que celle-ci qui est sub à un broker (broker de Nathan)
