<template>
  <transition name="fade">
    <div class="display" v-if="deckId !== null">
      <div class="game-result" v-if="gameResult !== null">{{gameResult}}</div>
      <section>
        <div class="players"></div>
        <div class="playerName">
          <strong :style="{color: playerOnePass ? 'rgba(150, 150, 150, 1)' : 'black'}">GRACZ 1</strong>
          <div>Wynik: {{playerOneScore}}</div>
        </div>
        <div class="optionButtons" v-if="gameResult === null">
          <button @click="playerOneDraw(1)" :disabled="playerTurn !== 1">DOBIERZ</button>
          <button
            @click="playerOnePass = true; checkWin(); switchTurn();"
            :disabled="playerTurn !== 1"
          >PASS</button>
        </div>
        <transition-group class="cards" tag="div" name="fade">
          <card v-for="card of startingCards" :key="card.code" :card="card" class="card"></card>
        </transition-group>
      </section>
      <section>
        <div></div>
        <div class="playerName">
          <strong :style="{color: playerTwoPass ? 'rgba(150, 150, 150, 1)' : 'black'}">GRACZ 2</strong>
          <div>Wynik: {{playerTwoScore}}</div>
        </div>
        <div class="optionButtons" v-if="gameResult === null">
          <button @click="playerTwoDraw(1)" :disabled="playerTurn !== 2">DOBIERZ</button>
          <button
            @click="playerTwoPass = true; checkWin(); switchTurn();"
            :disabled="playerTurn !== 2"
          >PASS</button>
        </div>
        <transition-group class="cards" tag="div" name="fade">
          <card v-for="card of startingCards2" :key="card.code" :card="card" class="card"></card>
        </transition-group>
      </section>
    </div>
    <img
      src="https://64.media.tumblr.com/a9d6b265d1f45ce6308ee680cfd2049f/tumblr_ne9n48NBbg1tzms7wo1_400.gif"
      class="loading-indicator"
      v-else
    />
  </transition>
</template>

<script>
import Card from "@/components/Card.vue";
import { VALUES } from "@/rules.js";

export default {
  components: {
    Card,
  },
  data: () => {
    return {
      startingCards: [],
      startingCards2: [],
      playerOnePass: false,
      playerTwoPass: false,
      deckId: null,
      gameResult: null,
      playerTurn: 1,
    };
  },
  mounted() {
    fetch("https://deckofcardsapi.com/api/deck/new/shuffle")
      .then((response) => response.json())
      .then((json) => {
        this.deckId = json.deck_id;
      })
      .then(() => this.playerTwoDraw(2))
      .then(() => this.playerOneDraw(2));
  },
  computed: {
    apiRoot() {
      return `https://deckofcardsapi.com/api/deck/${this.deckId}`;
    },
    playerOneScore() {
      let sum = 0;
      for (let card of this.startingCards) {
        console.log("card: ", card);
        if (isNaN(parseInt(card.value))) {
          sum += VALUES[card.value];
        } else {
          sum += parseInt(card.value);
        }
      }
      return sum;
    },
    playerTwoScore() {
      let sum = 0;
      for (let card of this.startingCards2) {
        console.log("card: ", card);
        if (isNaN(parseInt(card.value))) {
          sum += VALUES[card.value];
        } else {
          sum += parseInt(card.value);
        }
      }
      return sum;
    },
  },
  methods: {
    getCards(count) {
      const url = `${this.apiRoot}/draw/?count=${count}`;
      console.log("::getCards()", { count, url });
      return fetch(url)
        .then((response) => response.json())
        .then((json) => {
          console.debug("::getCards()", { json: JSON.stringify(json) });
          return json.cards;
        })
        .then((json) => {
          this.switchTurn();
          return json;
        });
    },
    switchTurn() {
      if (this.playerTurn === 1) {
        this.playerTurn = 2;
        return;
      }
      this.playerTurn = 1;
    },
    checkWin() {
      if (this.playerOnePass && this.playerTwoPass) {
        if (21 - this.playerOneScore < 21 - this.playerTwoScore) {
          this.gameResult = "Wygrał gracz #1";
          return;
        }
        if (21 - this.playerOneScore > 21 - this.playerTwoScore) {
          this.gameResult = "Wygrał gracz #2";
          return;
        }
        if (21 - this.playerOneScore === 21 - this.playerTwoScore) {
          this.gameResult = "REMIS";
          return;
        }
      }
      if (this.playerOneScore === 21) {
        this.gameResult = "Wygrał gracz #1";
        return;
      }
      if (this.playerTwoScore === 21) {
        this.gameResult = "Wygrał gracz #2";
        return;
      }
      if (
        this.startingCards.filter((card) => card.value === "ACE").length === 2
      ) {
        this.gameResult = "Wygrał gracz #1";
        return;
      }
      if (
        this.startingCards2.filter((card) => card.value === "ACE").length === 2
      ) {
        this.gameResult = "Wygrał gracz #2";
        return;
      }
      if (this.playerOneScore > 21) {
        this.gameResult = "Wygrał gracz #2";
      }
      if (this.playerTwoScore > 21) {
        this.gameResult = "Wygrał gracz #1";
      }
    },
    playerOneDraw(count) {
      this.getCards(count)
        .then(
          (cards) => (this.startingCards = this.startingCards.concat(cards))
        )
        .then(() => this.checkWin());
    },
    playerTwoDraw(count) {
      this.getCards(count)
        .then(
          (cards) => (this.startingCards2 = this.startingCards2.concat(cards))
        )
        .then(() => this.checkWin());
    },
  },
};
</script>
<style scoped>
.display {
  display: grid;
  grid-template-columns: 50% 50%;
  background-color: olivedrab;
  border-radius: 0.4rem;
  padding: 1rem;
}
.players {
  background-color: olivedrab;
  font-family: Arial, Helvetica, sans-serif;
}
.playerName {
  color: black;
  font-family: sans-serif;
  font-size: 1.6rem;
  text-align: center;
}
.playerName > strong {
  font-size: 140%;
}
.optionButtons {
  display: grid;
  grid-template-columns: 1fr 1fr;
  margin: 0.5rem 0;
}
.cards {
  display: grid;
  grid-template-columns: repeat(auto-fill, 6rem);
  justify-items: center;
}

.cards > .card {
  width: 6rem;
}

.game-result {
  grid-column: 1 / -1;
  text-align: center;
  font-size: 3rem;
  font-weight: 700;
  color: #d40000;
  text-transform: uppercase;
}
.loading-indicator {
  width: 100%;
  position: absolute;
  top: 0;
  left: 0;
}
</style>
