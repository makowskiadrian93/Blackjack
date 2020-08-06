
<template>
  <div class="game">
    <div class="row">
      <div class="blackjack">
        <h1 section="color: black">BLACK JACK</h1>

        <br />
        <section class="row" v-if="gameInProgress && 
        multiplayerInProgress">
          <button @click="startGame" class="btn btn-primary">POJEDYŃCZY GRACZ</button>
          <button @click="startMultiplayer" class="btn btn-primary">DWÓCH GRACZY</button>
        </section>
        <section
          class="display"
          style="background-color: green; margin; color: white;"
          v-if="!gameInProgress"
        >
          <div class="gracz">
            <h5 class="text-center">GRACZ 1</h5>
            <h5 class="text-center">SUMA KART: {{ suma }}</h5>
            <h5 class="karta"></h5>
            <div class="options">
              <button @click="addSelectedcard" class="btn btn-primary">DOBIERZ</button>
              <button @click="passTurn" class="btn btn-primary">PASS</button>
            </div>
          </div>
          <div class="gracz">
            <h5 class="text-center">KOMPUTER</h5>
            <h5 class="text-center">SUMA KART: {{ suma2 }}</h5>
            <h5 class="karta"></h5>
            <div class="options">
              <button class="btn btn-primary">X</button>
              <button class="btn btn-primary">X</button>
            </div>
          </div>
        </section>
        <section
          class="display"
          style="background-color: green; margin; color: white;"
          v-if="!multiplayerInProgress"
        >
          <div class="gracz">
            <h5 class="text-center">GRACZ 1</h5>
            <h5 class="text-center">SUMA KART: {{ suma3 }}</h5>
            <h5 class="karta"></h5>
            <div class="options">
              <button @click="addSelectedcard3" class="btn btn-primary">DOBIERZ</button>
              <button @click="passTurn3" class="btn btn-primary">PASS</button>
            </div>
          </div>
          <div class="gracz">
            <h5 class="text-center">GRACZ 2</h5>
            <h5 class="text-center">SUMA KART: {{ suma4 }}</h5>
            <h5 class="karta"></h5>
            <div class="options">
              <button @click="addSelectedcard4" class="btn btn-primary">DOBIERZ</button>
              <button @click="passTurn4" class="btn btn-primary">PASS</button>
            </div>
          </div>
        </section>

        <button @click="restartGame" class="restartBar">OD NOWA</button>
        <p>{{ cards[1].image }}</p>
        <p>Wylosowana karta: {{ Selectedcard }}</p>
        <component :is="pojedynczyGracz"></component>

        <div class="container"></div>
      </div>
    </div>
  </div>
</template>


<script>
import Selectedcard from "@/components/Selectedcard.vue";
import Newplayer from "@/components/Newplayer.vue";

export default {
  data: function() {
    return {
      cardsInHand: [],
      Selectedcard: 0,
      suma: 0,
      suma2: 0,
      suma3: 0,
      suma4: 0,
      gameInProgress: true,
      multiplayerInProgress: true,
      imPassing3: false,
      imPassing4: false,
      cards: [
        {
          image: "https://deckofcardsapi.com/static/img/KH.png",
          value: "KING",
          suit: "HEARTS",
          code: "KH"
        },

        {
          image: "https://deckofcardsapi.com/static/img/8C.png",
          value: "8",
          suit: "CLUBS",
          code: "8C"
        }
      ],
      components: {
        appSelectedcard: Selectedcard,
        appNewplayer: Newplayer
      }
    };
  },
  methods: {
    startGame: function() {
      this.gameInProgress = false;
      this.multiplayerInProgress = true;
    },
    startMultiplayer: function() {
      this.multiplayerInProgress = false;
      this.gameInProgress = true;
    },
    restartGame: function() {
      this.gameInProgress = true;
      this.multiplayerInProgress = true;
      this.suma = 0;
      this.suma2 = 0;
      this.suma3 = 0;
      this.suma4 = 0;
    },
    addSelectedcard: function() {
      var minimum = 2;
      var maximum = 11;
      var value = Math.max(Math.floor(Math.random() * maximum) + 1, minimum);
      this.suma = this.suma + value;
    },
    addSelectedcard3: function() {
      var minimum = 2;
      var maximum = 11;
      var value = Math.max(Math.floor(Math.random() * maximum) + 1, minimum);
      this.suma3 = this.suma3 + value;
      if (this.suma3 > 21) {
        alert("GRACZ 2 WYGRAŁ!");
      }
    },
    addSelectedcard4: function() {
      var minimum = 2;
      var maximum = 11;
      var value = Math.max(Math.floor(Math.random() * maximum) + 1, minimum);
      this.suma4 = this.suma4 + value;
      if (this.suma4 > 21) {
        alert("GRACZ 1 WYGRAŁ!");
      }
    },

    passTurn: function() {
      var minimum = 2;
      var maximum = 11;
      var value = Math.max(Math.floor(Math.random() * maximum) + 1, minimum);
      this.suma2 = this.suma2 + value;
      if (this.suma > this.suma2) {
        alert("GRACZ 1 WYGRAŁ!") } else if (this.suma3 > this.suma4) {
        alert("REMIS!")
        } else {
          alert("GRACZ 2 WYGRAŁ!")
        }
    },
    passTurn3: function() {
      this.imPassing3 = false;
      if (this.suma3 > this.suma4) {
        alert("GRACZ 1 WYGRAŁ!") } else if (this.suma3 > this.suma4) {
        alert("REMIS!")
        } else {
          alert("GRACZ 2 WYGRAŁ!")
        }
    
    },
    passTurn4: function() {
      this.imPassing4 = true;
    }
  }
};
</script>
<style>
body,
html {
  padding: 10px;
  margin: 10px;
  width: 100%;
}
.text-center {
  font-size: 1rem;
  display: grid;
  grid-template-columns: 1fr;
}

body {
  background-color: darkgreen;
}
h1 {
  width: 100%;
  font-size: 3rem;
  text-align: center;
  font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
}
h5 {
  width: 100%;
  font-size: 1rem;
  text-align: center;
  font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
}
.display {
  display: grid;
  grid-gap: 20px;
  grid-template-columns: 1fr 1fr;
}
.options {
  display: grid;
  grid-template-columns: 1fr 1fr;
}
.blackjack {
  display: grid;
  grid-template-columns: auto;
}
.row {
  display: grid;
  grid-template-columns: auto auto;
}
.text-center {
  display: grid;
  grid-template-columns: auto;
}
.game {
  display: grid;
  grid-gap: 20px;
  grid-template-columns: 1fr;
}
.karta {
  display: grid;
  grid-template-columns: 1fr;
  background-color: darkgrey;
  grid-template-rows: 300px;
}
.restartBar {
  display: grid;
  grid-template-columns: auto-fill;
}
</style>
