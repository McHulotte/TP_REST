# Compte rendu TP Protocole pour l'Internet des Objets REST

---

## Kubiak Victor

---

### **Partie 1 : Utiliser la méthode REST :**

**1.** J'ai créé le dépôt GitHub sous McHulotte/TP_REST et invité le collaborateur SebDruon

**2.** En pilotant depuis l'interface web sur l'adresse http://10.202.255.252 je peux allumer/éteindre et contrôler la puissance consommée.

**3.** 

- Avec la commande suivante je peux récupérer des informations sur la consommation :

```shell
curl 10.202.255.252/meter/0
{"power":48.52,"overpower":0.00,"is_valid":true,"timestamp":1606215925,"counters":[48.663, 48.776, 46.173],"total":394}
```

On peut voir que la consommation actuelle est de 48.52W.

- Avec la commande suivante je peux allumer/éteindre la prise :

```shell
curl http://10.202.255.252/relay/0?turn=on
{"ison":true,"has_timer":false,"timer_started":0,"timer_duration":0,"timer_remaining":0,"overpower":false,"source":"http"}
curl http://10.202.255.252/relay/0?turn=off
{"ison":false,"has_timer":false,"timer_started":0,"timer_duration":0,"timer_remaining":0,"overpower":false,"source":"http"}
```

  **4.**

Avec la commande jq on peut récupérer les informations renvoyés par la prise plus précisément. Exemple avec la consommation actuelle :

```shell
curl 10.202.255.252/meter/0 | jq .power
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   118  100   118    0     0   7375      0 --:--:-- --:--:-- --:--:--  7375
48.63
```

**5.**

J'ai créé quelques scripts que j'ai ajouté à mon GitHub (pour allumer, eteindre et vérifier l'état des prises).

Voici l'exemple du script pour vérifier l'état des prises :

```bash
#!/bin/sh

if [ "$#" -ne 1 ]; then
        echo "Mauvais nombre d'arguments\n";
        exit 1;
fi

case $1 in
        0) 
        curl -s http://10.202.255.252/relay/0 | jq .ison;
        curl -s http://10.202.255.253/relay/0 | jq .ison;
        echo "\n"
        ;;
        1) 
        curl -s http://10.202.255.252/relay/0 | jq .ison;
        echo "\n"
        ;;
        2) 
        curl -s http://10.202.255.253/relay/0 | jq .ison;
        echo "\n"
        ;;
        *) echo "Choisir en Argument la lampe 1 ou la lampe 2 ou les deux (0) !\n";
        exit 1
        ;;
esac
```



**6.**

J'ai donc lancé le script permettant d'allumer un plug voici la capture des échanges :

![image-20201124133253992](/home/test/.config/Typora/typora-user-images/image-20201124133253992.png)

On a donc une requette HTTP GET et une requête HTTP réponse 200 avec le JSON correspondant.

**reqête GET :** 147 Octets

**requête réponse 200 OK :** 290 Octets

**Total de l'échange : 437 Octets**

Ce qui est très lourd pour un commande aussi simple que d'allumer ou éteindre une prise.



**7.**

J'ajoute un tag à mon dernier commit :

```shell
git tag -a partie_1 655e159 -m "Fin de la partie 1"
```

---



### **Partie 2 : MQTT**

Tout d'abord pour retrouvé le modèle de la prise je me suis abonné à tous les modèle clients du broker (il y en a une seule donc la seule réponse sera le bon modèle) :

```shell
mosquitto_sub -h 10.202.0.107 -t 'shellies/+/relay/0'
```

En capturant la trame j'ai pu retrouver le modèle de la prise pour pouvoir m'abonné au bon topic :

**shellyplug-s-6A6534**

Avant de créer mes scripts je teste d'abord en ligne de commande de publier sur le topic pour toggle on/off la prise :

```shell
mosquitto_pub -h 10.202.0.107 -t 'shellies/shellyplug-s-6A6534/relay/0/command' -m "toggle"
```

J'ai donc modifié mes scripts afin de remplacer les commandes curl par des commandes sub et pub mqtt.

Je l'ai ai ajouté à git puis ajouté le tag :

```shell
git tag -a partie_2 0a73d1297d0 -m "Fin de la partie 2"
```

---



### **Partie 3 : Serveur REST**

J'ai réussi à mettre en place la connexion nginx / php fpm (fast_CGI). Je suis content.

