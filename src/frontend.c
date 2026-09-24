#include "frontend.h"

#include <agb/types.h>

#include "battery.h"
#include "bios.h"
#include "collection.h"
#include "credits.h"
#include "dialogue.h"
#include "display.h"
#include "festate.h"
#include "include_asm.h"
#include "iwram.h"
#include "keystate.h"
#include "levelrow.h"
#include "levelselect.h"
#include "menuobject.h"
#include "motion.h"
#include "multiplayer.h"
#include "music.h"
#include "ram.h"
#include "sound.h"
#include "spritetext.h"
#include "transition.h"
#include "unsorted.h"

FrontendObject _8069FC8[] = {
    [STATE_NINTENDO]
    = { LAYOUT_NINTENDO, &_8069FA0, sub_8043A0C, Background_8049A84, sub_8049CE8, sub_8049DE0 },
    [STATE_1]
    = { LAYOUT_LEGALS, &_8069FA0, sub_8043A0C, Background_8049AF8, sub_8049DE0, sub_8049DE0 },
    [STATE_2] = { LAYOUT_18, &_8069FA0, sub_8043A0C, Background_8049AF8, sub_8049DE0, sub_8049DE0 },
    [STATE_NELVANA]
    = { LAYOUT_NELVANA, &_8069FA0, sub_8043A0C, Background_8049AF8, sub_8049DE0, sub_8049DE0 },
    [STATE_4]
    = { LAYOUT_DRIGHTS, &_8069FA0, sub_8043A0C, Background_8049AF8, sub_8049DE0, sub_8049DE0 },
    [STATE_FULLFAT]
    = { LAYOUT_FULLFAT, &_8069FA0, sub_8043A58, Background_8049AF8, sub_8049DE0, sub_8049DE0 },
    [STATE_LANGUAGE]
    = { LAYOUT_LANGUAGE, &_80689C8, sub_8043AA0, Background_80498F8, sub_8049F9C, sub_8049DE0 },
    [STATE_7] = { LAYOUT_15, &_8069318, sub_804568C, Background_8049AF8, sub_8049DE0, sub_8049DE0 },
    [STATE_8] = { LAYOUT_20, &_80692C8, sub_8045638, Background_8049B68, sub_8049DE0, sub_8049F9C },
    [STATE_9] = { LAYOUT_20, &_80692F0, sub_804566C, Background_80498F8, sub_8049F9C, sub_8049DE0 },
    [STATE_10]
    = { LAYOUT_11, &_8069400, sub_8045848, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_11]
    = { LAYOUT_11, &_8068CA4, sub_8043CF8, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_12]
    = { LAYOUT_11, &_806944C, sub_8045A7C, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_13] = { LAYOUT_4, &_80694EC, sub_8045CB4, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_14]
    = { LAYOUT_11, &_8069538, sub_80461D8, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_SELECT_BLADE] = { LAYOUT_7, &_80699B4, selectBladeFrontendHandler, Background_8049A24,
        sub_8049FF8, sub_8049FF8 },
    [STATE_16] = { LAYOUT_7, &_80696F4, sub_8046500, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_17] = { LAYOUT_9, &_8068ED8, sub_8044054, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_18]
    = { LAYOUT_11, &_8068CF8, sub_8043D84, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_19] = { LAYOUT_9, &_80690B8, sub_804444C, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_20]
    = { LAYOUT_11, &_806927C, sub_80453D8, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_21]
    = { LAYOUT_11, &_806927C, sub_804541C, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_22]
    = { LAYOUT_11, &_8069648, sub_8046424, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_23]
    = { LAYOUT_11, &_806971C, sub_8046814, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_24] = { LAYOUT_9, &_8069794, sub_8046A0C, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_25]
    = { LAYOUT_11, &_80697E4, sub_8046CC4, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_CREDITS]
    = { LAYOUT_9, &_8067D3C, creditsFrontendHandler, Background_8049A24, sub_8049FF8, sub_8049FF8 },
    [STATE_27] = { LAYOUT_7, &_80686E8, sub_80413FC, Background_8049A24, sub_8049FF8, sub_8049FF8 },
    [STATE_DIALOG]
    = { LAYOUT_DIALOG, &_806879C, sub_80420C4, Background_80499BC, sub_8049F58, sub_8049F58 },
    [STATE_29] = { LAYOUT_9, &_8069CDC, sub_8047E5C, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_30]
    = { LAYOUT_11, &_8069D28, sub_80480EC, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_31] = { LAYOUT_9, &_8069DE8, sub_8048AE8, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_32]
    = { LAYOUT_11, &_8069D74, sub_8048310, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_33]
    = { LAYOUT_11, &_8069DC0, sub_804868C, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_34]
    = { LAYOUT_11, &_80690E0, sub_80448F4, Background_80498F8, sub_8049F9C, sub_8049F9C },
    [STATE_35] = { LAYOUT_5, &_806912C, sub_8044C48, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_36] = { LAYOUT_5, &_8069154, sub_8044ED4, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_37] = { LAYOUT_5, &_806917C, sub_8045160, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_38] = { LAYOUT_9, &_8069E10, sub_8048D8C, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_TRANSITION]
    = { LAYOUT_3, &_80687C8, sub_804257C, Background_80499BC, sub_8049F58, sub_8049F58 },
    [STATE_COLLECTION] = { LAYOUT_COLLECTION, &_8068818, collectionListFrontendHandler,
        Background_8049A24, sub_8049FF8, sub_8049FF8 },
    [STATE_41] = { LAYOUT_9, &_80697BC, sub_8046B94, Background_8049A24, sub_8049F9C, sub_8049F9C },
    [STATE_42] = { LAYOUT_11, &_8069E64, nullsub_33, Background_80498F8, sub_8049F9C, sub_8049F9C },
};

const unk8* _806A3D0[25] = {
    "This text is a placeholder for level entry dialog sections. {C14}Bring on the {C13}left{c} "
    "head{c}{A2}, and then the right head{a3}<\f>Now do{T} a transition<\f>And now do a single "
    "flash {f}<\f>And {t1}now change to a different screen{t2}<\f>And now change to yet a "
    "another screen{t3}<\f>And now start some repeated flashing {f4}<\f>And a great deal of text "
    "right here. {t1}And a great deal of text right here. And a great deal of text right here. "
    "And a great deal of text right here.<\f>And then remove the right head{b}... <\f>But then "
    "replace the left head{A4}...<\f>And the start to move it slowly{V16}...<\f>And then the "
    "right{a5}{v-32}<\f>Animate them both now!{Q}{q}<\f>And then stop the left one{U}"
};

static const unk8* _806A434[5] = {
    "{f}{A10}... {C14}Tyson{c} has returned home to his {C14}Grandpa's{c} house after winning "
    "the Beyblade World Tournament.<\f>Today after school, {C14}Tyson{c} is entered as the star "
    "attraction in a local Beyblade playoff held on the roof of Zody's supermarket.<\f>When "
    "{C14}Tyson{c} arrives, he is pitted against a mysterious challenger known only as "
    "{f}{C14}Mister X{c}{a8}...<\f>{t2}{Q}{C12}\"You're mine! Let it "
    "Rip{f4}!!\"{c}<\f>{U}{C14}Tyson's{c} Dragoon flies into the arena, and although "
    "{C14}Tyson{c} is doing his best, {C14}Mister X's{c} blade always seems to be one step "
    "ahead...<\f>{q}{C13}\"Your strategy is painfully obvious, {C14}Tyson{c}, and if you think "
    "you can win by the powers of your Beyblade alone, you're sadly "
    "mistaken.\"{c}<\f>{u}{b}{B}Despite {C14}Tyson's{c} best efforts, {C14}Mister X{c} easily "
    "defeats him...<\f>{f}{A5}{Q}{C12}\"But how could this happen!?\"{c}",
    "{f}{A10}... {C14}Tyson{c} ha vuelto a casa de su {C14}abuelo{c} de ganar el Torneo Mundial "
    "de Peonzas. Hoy, después de la escuela, {C14}Tyson{c} ha participado como atracción estelar "
    "en una final local de peonzas celebrada en el tejado del supermercado de Zody.<\f>Cuando "
    "{C14}Tyson{c} llega, se encuentra con un misterioso contrincante conocido únicamente como "
    "{f}{C14}Señor X{c}{a8}...<\f>{t2}{Q}{C12}\"Eres mío. ¡¡¡Lanza!{f4}!!\"{c}<\f>{U}El dragón "
    "de {C14}Tyson{c} vuela a la arena y, aunque {C14}Tyson{c} lo hace lo mejor que puede, la "
    "peonza de {C14}Señor X{c} siempre parece ir un paso por delante...<\f>{q}{C13}\"Tu "
    "estrategia es dolorosamente obvia, {C14}Tyson{c}, y si crees que puedes ganar únicamente "
    "por los poderes de tu peonza, estás tristemente equivocado.\"{c}<\f>{u}{b}{B}A pesar de los "
    "enormes esfuerzos de {C14}Tyson{c}, {C14}Señor X{c} le derrota con "
    "facilidad...<\f>{f}{A5}{Q}{C12}\"¿¡Pero cómo ha podido ocurrir esto!?\"{c}",
    "{f}{A10}... {C14}Tyson{c} ist gerade wieder zuhause bei seinem {C14}Großvater{c} "
    "angekommen, nachdem er die Beyblade-Weltmeisterschaft gewonnen hat. Heute soll "
    "{C14}Tyson{c} nach der Schule als der Star bei einem kleinen Beyblade-Wettbewerb auf dem "
    "Dach von Zodys Supermarkt auftreten.<\f>Als {C14}Tyson{c} ankommt, sieht er sich mit einem "
    "Herausforderer konfrontiert, der nur als {f}{C14}Mister X{c}{a8} bekannt "
    "ist...<\f>{t2}{Q}{C12}\"Dich krieg ich. Let it rip!{f4}!!\"{c}<\f>{U}{C14}Tysons{c} Dragoon "
    "fliegt durch die Arena, aber obwohl {C14}Tyson{c} alles gibt, scheint das Blade von "
    "{C14}Mister X{c} ihm immer einen Schritt voraus zu sein...<\f>{q}{C13}\"Deine Strategie ist "
    "viel zu leicht durchschaubar, {C14}Tyson{c}. Und wenn du glaubst, du könntest allein durch "
    "die Kraft deines Beyblades gewinnen, hast du dich sehr getäuscht.\"{c}<\f>{u}{b}{B}Obwohl "
    "{C14}Tyson{c} sein Bestes gibt, wird er von {C14}Mister X{c} deutlich "
    "geschlagen...<\f>{f}{A5}{Q}{C12}\"Aber wie ist das möglich!?\"{c}",
    "{f}{A10}... {C14}Tyson{c} est rentré chez son {C14}grand-père{c} après avoir remporté le "
    "championnat du monde de Beyblade. Aujourd'hui, après l'école, {C14}Tyson{c} a été "
    "l'attraction vedette d'un tournoi local de Beyblade organisé sur le toit du supermarché de "
    "Zody.<\f>A son arrivée, {C14}Tyson{c} est opposé à un mystérieux adversaire connu seulement "
    "sous le nom de {f}{C14}M. X{c}{a8}...<\f>{t2}{Q}{C12}\"Je vais t'avoir. Hyper vitesse "
    "{f4}!\"{c}<\f>{U}Le Dragoon de {C14}Tyson{c} vole vers l'arène. {C14}Tyson{c} fait de son "
    "mieux, mais {C14}Mister X{c} semble toujours le devancer...<\f>{q}{C13}\"Ta stratégie est "
    "trop évidente, {C14}Tyson{c}, et si tu penses gagner en n'exploitant que la puissance de "
    "ton Beyblade, tu te trompes lourdement.\"{c}<\f>{u}{b}{B}Malgré tous ses efforts, "
    "{C14}Tyson{c} est facilement battu par {C14}M. X{c}...<\f>{f}{A5}{Q}{C12}\"Mais comment "
    "cela a-t-il pu arriver?\"{c}",
    "{f}{A10}... {C14}Takao{c} è tornato a casa presso {C14}Nonno Jei{c} dopo aver vinto il "
    "Torneo Mondiale di Beyblade. Oggi, dopo la scuola, {C14}Takao{c} è diventato la stella "
    "della sfida locale di Beyblade che si tiene sul tetto del supermercato di Zody.<\f>Quando "
    "{C14}Takao{c} arriva, deve battersi contro un misterioso sfidante noto solo come "
    "{f}{C14}Mister X{c}{a8}...<\f>{t2}{Q}{C12}\" Sei mio. 3, 2, 1, pronti... "
    "lancio{f4}!\"{c}<\f>{U}Il Dragoon di {C14}Takao{c} vola nell'arena. Anche se {C14}Takao{c} "
    "fa del suo meglio, il Beyblade di {C14}Mister X{c} sembra anticiparlo "
    "sempre...<\f>{q}{C13}\"La tua strategia è troppo banale, {C14}Takao{c}. Se credi di poter "
    "vincere contando solo sulla potenza del tuo Beyblade, ti sbagli di "
    "grosso.\"{c}<\f>{u}{b}{B}Nonostante gli sforzi di {C14}Takao{c}, {C14}Mister X{c} lo "
    "sconfigge facilmente...<\f>{f}{A5}{Q}{C12}\"Ma come è potuto accadere?\"{c}",
};

static const unk8* _806A448[5] = {
    "{f}{A6}{C14}Max{c} is out walking when suddenly he is confronted by a stranger called "
    "{f}{C14}Mariam{c}{a7} and challenged to a battle...<\f>{q}{C13}\"I'm ready when you "
    "are!\"{c}<\f>{u}{t2}{Q}{C12}\"OK! But let me warn you - I won't hold back because you're "
    "new at this! Let it Rip{f4}!!\"{c}<\f>{U}{b}{B}{C14}Max{c} watches in absolute horror as "
    "{C14}Mariam's{c} blade defeats his with ease...<\f>At the same time {f}{C14}Ray{c}{A9} is "
    "confronted by {f}{C14}Joseph{c}{a2} and is challenged to a battle...<\f>{Q}{C12}\"Man, this "
    "is an intense battle!\"{c}<\f>{U}{q}{C13}\"Just wait, {C14}Ray{c}. This battle is going to "
    "get more intense{f4}.\"{c}<\f>{u}{B}{b}{C14}Ray's{c} defeat is as swift and crushing as "
    "{C14}Max's{c} and {C14}Tyson's{c}... What is going on?<\f>It seems there are a mysterious "
    "group of people determined to beat the world champions, the Bladebreakers!",
    "{f}{A6}{C14}Max{c} ha salido a pasear cuando, de repente, una extraña llamada "
    "{f}{C14}Mariam{c}{a7} se enfrenta a él y le reta a una batalla...<\f>{q}{C13}\"¡Estoy "
    "preparada en cuanto tú lo estés!\"{c}<\f>{u}{t2}{Q}{C12}\"¡De acuerdo! Pero déjame "
    "avisarte; ¡no voy a controlarme porque seas nueva en esto!, "
    "¡Lanza!\"{c}<\f>{U}{b}{B}{C14}Max{c} observa horrorizado cómo la peonza de {C14}Mariam{c} "
    "derrota a la suya con facilidad...<\f>Al mismo tiempo que {f}{C14}Ray{c}{A9} se enfrenta a "
    "{f}{C14}Joseph{c}{a2} y se prepara para una batalla...<\f>{Q}{C12}\"Tío, qué batalla tan "
    "intensa.\"{c}<\f>{U}{q}{C13}\"Pues espera, {C14}Ray{c}, esta batalla va a ponerse aún más "
    "intensa{f4}.\"{c}<\f>{u}{B}{b}La derrota de {C14}Ray{c} es rápida y aplastante, al igual "
    "que la de {C14}Max{c} y {C14}Tyson{c}... ¿Qué está pasando?<\f>Parece que hay un misterioso "
    "grupo de personas decididas a derrotar a los campeones del mundo, ¡los Bladebreakers!",
    "{f}{A6}{C14}Max{c} geht gerade spazieren, als eine Fremde mit dem Namen "
    "{f}{C14}Mariam{c}{a7} ihn anspricht und zu einem Kampf "
    "herausfordert...<\f>{q}{C13}\"Bereit, wenn du es bist!\"{c}<\f>{u}{t2}{Q}{C12}\"OK! Aber "
    "ich warne dich - ich mach's dir nicht leicht, nur weil du 'ne Anfängerin bist! Let it "
    "rip{f4}!!\"{c}<\f>{U}{b}{B}{C14}Max{c} muss entsetzt mit ansehen, wie {C14}Mariams{c} Blade "
    "sein eigenes mit Leichtigkeit besiegt...<\f>Zur gleichen Zeit wird {f}{C14}Ray{c}{A9} von "
    "{f}{C14}Joseph{c}{a2} zu einem Kampf herausgefordert...<\f>{Q}{C12}\"Mann, das nenn ich "
    "einen harten Kampf!\"{c}<\f>{U}{q}{C13}\"Wart's nur ab, {C14}Ray{c}. Dieser Kampf wird "
    "gleich noch viel härter{f4}.\"{c}<\f>{u}{B}{b}{C14}Ray{c} wird ebenso schnell und deutlich "
    "geschlagen wie {C14}Max{c} und {C14}Tyson{c}... was geht hier vor?<\f>Es scheint sich eine "
    "mysteriöse Gruppe zusammen gefunden zu haben, um die Weltmeister, die Bladebreakers, zu "
    "besiegen!",
    "{f}{A6}{C14}Max{c} se promène lorsqu'une personne inconnue appelée {f}{C14}Mariam{c}{a7} "
    "l'aborde et lui lance un défi...<\f>{q}{C13}\"Quand tu "
    "veux!\"{c}<\f>{u}{t2}{Q}{C12}\"D'accord! Mais attention: j'irai à fond, même si c'est la "
    "première fois que je me bats contre toi! Hyper vitesse {f4}!\"{c}<\f>{U}{b}{B}{C14}Max{c} "
    "regarde avec horreur le Beyblade de {C14}Mariam{c} vaincre facilement le sien...<\f>Au même "
    "moment, {f}{C14}Ray{c}{A9} est défié par {f}{C14}Joseph{c}{a2} qui lui propose un "
    "combat...<\f>{Q}{C12}\"Eh, quel combat intense!\"{c}<\f>{U}{q}{C13}\"Attends un peu, "
    "{C14}Ray{c}, il va être encore plus intense{f4}.\"{c}<\f>{u}{B}{b}La défaite de {C14}Ray{c} "
    "est aussi rapide et sans appel que celles de {C14}Max{c} et {C14}Tyson{c}... Que se "
    "passe-t-il?<\f>Il semble qu'un mystérieux groupe ait décidé de battre les champions du "
    "monde, les Bladebreakers!",
    "{f}{A6}{C14}Max{c} sta passeggiando quando viene affrontato da una straniera di nome "
    "{C14}Mao{c}, che lo sfida...<\f>{q}{C13}\"Io sono pronta, e "
    "tu?\"{c}<\f>{u}{t2}{Q}{C12}\"OK! Ma ti avverto: non ci andrò piano solo perché tu non hai "
    "esperienza. 3, 2, 1, pronti... lancio{f4}!\"{c}<\f>{U}{b}{B}{C14}Max{c} assiste con orrore "
    "alla sua sconfitta, mentre il Beyblade di {C14}Mao{c} trionfa...<\f>Contemporaneamente, "
    "{f}{C14}Rey{c}{A9} viene affrontato da {f}{C14}Joseph{c}{a2} e "
    "sfidato...<\f>{Q}{C12}\"Accidenti, che battaglia intensa!\"{c}<\f>{U}{q}{C13}\"Aspetta, "
    "{C14}Rey{c}, diventerà ancora più intensa{f4}.\"{c}<\f>{u}{B}{b}La sconfitta di {C14}Rey{c} "
    "è veloce e dolorosa come quella di {C14}Max{c} e di {C14}Takao{c}. Che cosa "
    "succede?<\f>Sembra che ci sia un misterioso gruppo di persone decise a battere i campioni "
    "del mondo: i Bladebreakers!",
};

static const unk8* _806A45C[5] = {
    "{C14}Kenny{c}{A5}, the Bladebreakers' assistant, runs into {f}{C14}Hilary{c}{a0}, a girl "
    "from school, while walking to meet with {C14}Tyson{c}.<\f>{C14}Kenny{c} has some important "
    "news about {C14}Mister\x8FX...{c}<\f>... who, Kenny has learned, is actually called "
    "{C14}Ozuma{c} and is using an invisible bit beast to give him the edge on "
    "{C14}Tyson{c}.<\f>{b}{B}Before {C14}Kenny{c} and {C14}Hilary{c} can get there, they are "
    "kidnapped by two {C14}Men in Black{c}{f}{A23}{f}{a24}...",
    "{C14}Kenny{c}{A5}, el asistente de los Bladebreakers, se encuentra con "
    "{f}{C14}Hilary{c}{a0}, una chica de la escuela, mientras va de camino a "
    "encontrarse con {C14}Tyson.{c} {C14}Kenny{c} tiene noticias importantes "
    "sobre el {C14}Señor X{c}, de quien se ha enterado que se llama realmente "
    "{C14}Ozuma{c}, y que está usando una Bit Beast invisible para aventajar "
    "a {C14}Tyson{c}.<\f>{b}{B}Antes de que {C14}Kenny{c} y {C14}Hilary{c} "
    "puedan llegar allí, son secuestrados por dos {C14}Hombres de "
    "Negro{c}{f}{A23}{f}{a24}...",
    "{C14}Kenny{c}{A5}, der technische Kopf der Bladebreakers, trifft "
    "{f}{C14}Hilary{c}{a0}, ein Mädchen aus der Schule, als er gerade "
    "unterwegs zu {C14}Tyson{c} ist. {C14}Kenny{c} hat erfahren, dass hinter "
    "{C14}Mister X{c} ein Mann namens {C14}Ozuma{c} steckt. Dieser verwendet "
    "offenbar ein unsichtbares Bit Beast, wodurch er sich {C14}Tyson{c} "
    "gegenüber einen Vorteil verschafft.<\f>{b}{B}Aber bevor {C14}Kenny{c} "
    "und {C14}Hilary{c} dort ankommen, werden sie von zwei {C14}schwarz "
    "gekleideten Männern{c} entführt{f}{A23}{f}{a24}...",
    "{C14}Kenny{c}{A5}, l'assistant des Bladebreakers, tombe sur "
    "{f}{C14}Hilary{c}{a0}, une fille de l'école alors qu'il va rejoindre "
    "{C14}Tyson{c}. {C14}Kenny{c} a des nouvelles importantes sur {C14}Mister "
    "X{c}: il a appris qu'il s'appelait en fait {C14}Ozuma{c} et utilisait un "
    "Bit Beast invisible pour prendre l'avantage sur "
    "{C14}Tyson{c}.<\f>{b}{B}Mais, en chemin, {C14}Kenny{c} et {C14}Hilary{c} "
    "sont enlevés par deux {C14}hommes en noir{c}{f}{A23}{f}{a24}...",
    "Il {C14}Prof. Kappa{c}{A5}, l'assistente dei Bladebreakers, incontra "
    "{f}{C14}Hilary{c}{a0} mentre torna da scuola per incontrare "
    "{C14}Takao{c}. Ha delle importanti notizie su {C14}Mister X{c}: ha "
    "scoperto che in realtà si chiama {C14}Ozuma{c} e ha usato un Bit Beast "
    "invisibile per sconfiggere {C14}Takao{c}.<\f>{b}{B}Prima di arrivare "
    "alla loro destinazione, il {C14}Prof. Kappa{c} e {C14}Hilary{c} vengono "
    "rapiti da due {C14}uomini vestiti di nero{c}{f}{A23}{f}{a24}...",
};

static const unk8* _806A470[5] = {
    "{C14}Tyson{c} {A10}is heading to the park to have a rematch with "
    "{C14}Ozuma{c} when he sees a van speeding towards him.<\f>He looks up at "
    "it and sees the {C14}Men in black{c}{a24} behind the "
    "wheel.<\f>{C14}Tyson{c} hears some muffled screams from inside the "
    "van.<\f>{A5}{a0}{C12}{Q}{q}\"Help!!\"{c}<\f>{U}{u}{b}{B}{A10}{Q}{C12}"
    "\"It's {C14}Hilary{c} and {C14}Kenny{c}. Hey, where are you taking "
    "them!? I'm coming guys - HOLD ON!\"{c}<\f>{U}{B}{C14}Tyson{c} follows "
    "the {C14}Men in black{c}. Their trail leads to a giant rusty boat...",
    "{C14}Tyson{c} {A10}se dirige al parquet para tener otro encuentro con "
    "{C14}Ozuma{c}, cuando ve una furgoneta que se acerca a él a toda "
    "velocidad, mira hacia ella y ve a los {C14}Hombres de Negro{c}{a24} al "
    "volante.<\f>{C14}Tyson{c} oye unos gritos apagados que vienen del "
    "interior de la "
    "furgoneta<\f>{A5}{a0}{C12}{Q}{q}\"Socorro\"{c}<\f>{U}{u}{b}{B}{A10}{Q}{"
    "C12}\"Son {C14}Hilary{c} y {C14}Kenny{c}. Eh, ¡¿dónde los lleváis?! Ya "
    "voy, chicos, ¡AGUANTAD!\"{c}<\f>{U}{B}{C14}Tyson{c} sigue a los "
    "{C14}Hombres de Negro{c} y su pista le lleva a un gran barco oxidado...",
    "{C14}Tyson{c} {A10}ist auf dem Weg zu einem Rückkampf mit {C14}Ozuma{c}, als ein "
    "Lieferwagen mit hoher Geschwindigkeit an ihm vorbeifährt. Er sieht hoch und bemerkt zwei "
    "{C14}schwarz gekleidete Männer{c}{a24} in der Fahrerkabine.<\f>{C14}Tyson{c} hört gedämpfte "
    "Schreie aus dem Innern des "
    "Lieferwagens.<\f>{A5}{a0}{C12}{Q}{q}\"Hilfe!\"{c}<\f>{U}{u}{b}{B}{A10}{Q}{C12}\"Das sind "
    "{C14}Hilary{c} und {C14}Kenny{c}! Hey, wo bringt ihr sie hin!? Ich komme, Leute - HALTET "
    "DURCH!\"{c}<\f>{U}{B}{C14}Tyson{c} folgt den {C14}schwarz gekleideten Männern{c}. Die Spur "
    "führt zu einem gigantischen, verrosteten Schiff...",
    "{C14}Tyson{c} {A10}se dirige vers le parc pour une revanche avec {C14}Ozuma{c} lorsqu'il "
    "voit une camionnette foncer vers lui ; il lève le nez et voit les {C14}hommes en "
    "noir{c}{a24} au volant.<\f>{C14}Tyson{c} entend des cris étouffés en provenance de la "
    "camionnette.<\f>{A5}{a0}{C12}{Q}{q}\"A l'aide!\"{c}<\f>{U}{u}{b}{B}{A10}{Q}{C12}\"Ce sont "
    "{C14}Hilary{c} et {C14}Kenny{c}. Eh, où les emmenez-vous? J'arrive! TENEZ "
    "BON!\"{c}<\f>{U}{B}{C14}Tyson{c} suit les {C14}hommes en noir{c} et leur piste le mène à un "
    "énorme bateau rouillé...",
    "{C14}Takao{c} {A10}si sta dirigendo al parco per la rivincita con {C14}Ozuma{c} e vede un "
    "furgone che gli si avvicina velocemente. Lo guarda e vede gli {C14}uomini vestiti di "
    "nero{c}{a24} seduti all'interno.<\f>{C14}Takao{c} sente delle confuse invocazioni di aiuto "
    "provenire dal "
    "furgone.<\f>{A5}{a0}{C12}{Q}{q}\"Aiuto!\"{c}<\f>{U}{u}{b}{B}{A10}{Q}{C12}\"Sono "
    "{C14}Hilary{c} e il {C14}Prof. Kappa{c}. Ehi, dove li stanno portando? Arrivo, ragazzi. "
    "RESISTETE!\"{c}<\f>{U}{B}{C14}Takao{c} segue gli {C14}uomini vestiti di nero{c}. Le loro "
    "tracce lo portano a una grossa nave arrugginita...",
};

static const unk8* _806A484[5] = {
    "{C14}Tyson{c} explores the seemingly empty ship searching for {C14}Kenny{c} and "
    "{C14}Hilary{c}. Eventually he discovers them trapped in a glass cage. "
    "<\f>{A5}{C12}{Q}\"{C14}Tyson{c}! I knew you'd make it!\" {c}<\f>{U}{a0}{C12}{q}\"Yes, and "
    "what took you so long?\"{c}<\f>{u}{b}{B}{t1}{f}{C14}Gideon{c}{a19} and the {C14}Men in "
    "black{c}{A24} appear...<\f>{C13}{q}{Q}\"We wish to challenge {C14}Tyson{c}, the world "
    "champion, to a battle.\"{c}<\f>{U}{u}{A10}{C12}{Q}\"What? Are you for real? You mean you "
    "went through all that trouble to get me here just so you could challenge me to a battle?\" "
    "{c}<\f>{U}{q}{C13}\"Do you accept?\"{c}<\f>{u}{Q}{C12}\"You're on, but on one condition - "
    "let them go!\"{c}<\f>{U}{A23}{a24}{Q}{q}{C13}\"Very well. We will set your friends free - "
    "but only if you win.{f4}\"{c}",
    "{C14}Tyson{c} explora el barco, aparentemente vacío, en busca de {C14}Kenny{c} y "
    "{C14}Hilary{c} ; Finalmente, les encuentra atrapados en una jaula de cristal. "
    "<\f>{A5}{C12}{Q}\"¡{C14}Tyson{c}! ¡Sabía que lo conseguirías!\" {c}<\f>{U}{a0}{C12}{q}\"Sí, "
    "¿y por qué tardaste tanto?\"{c}<\f>{u}{b}{B}{t1}{f}{C14}Gideon{c}{a19} y los {C14}Hombres "
    "de Negro{c}{A24} aparecen...<\f>{C13}{q}{Q}\"Queremos retar a {C14}Tyson{c}, el campeón del "
    "mundo, a una batalla.\"{c}<\f>{U}{u}{A10}{C12}{Q}\"¿Qué? ¿Vais en serio? ¿Queréis decir que "
    "habéis causado todo este revuelo para atraerme hasta aquí y poder retarme a una batalla?\" "
    "{c}<\f>{U}{q}{C13}\"¿Aceptas?\"{c}<\f>{u}{Q}{C12}\"De acuerdo, pero con una condición: "
    "dejadles marchar\"{c}<\f>{U}{A23}{a24}{Q}{q}{C13}\"Muy bien. Liberaremos a tus amigos, pero "
    "solo si ganas{f4}\"{c}",
    "{C14}Tyson{c} erkundet das offensichtlich verlassene Schiff auf der Suche nach "
    "{C14}Kenny{c} und {C14}Hilary{c}. Schließlich entdeckt er sie, gefangen in einem gläsernen "
    "Käfig.<\f>{A5}{C12}{Q}\"{C14}Tyson{c}! Ich wusste, dass du kommen würdest!\" "
    "{c}<\f>{U}{a0}{C12}{q}\"Ja, aber warum hast du so lange "
    "gebraucht?\"{c}<\f>{u}{b}{B}{t1}{f}{C14}Gideon{c}{a19} und die {C14}schwarz gekleideten "
    "Männer{c}{A24} erscheinen...<\f>{C13}{q}{Q}\"Wir möchten {C14}Tyson{c}, den Weltmeister, zu "
    "einem Kampf herausfordern.\"{c}<\f>{U}{u}{A10}{C12}{Q}\"Was? Was soll das? Dieser ganze "
    "Aufstand, nur um mich zu einem Kampf herauszufordern?\" {c}<\f>{U}{q}{C13}\"Nimmst du "
    "an?\"{c}<\f>{u}{Q}{C12}\"Gut, ich werde kämpfen. Aber nur unter einer Bedingung: lasst sie "
    "gehen!\"{c}<\f>{U}{A23}{a24}{Q}{q}{C13}\"So soll es sein. Wir werden deine Freunde frei "
    "lassen. Aber nur, wenn du gewinnst!{f4}\"{c}",
    "{C14}Tyson{c} explore le bateau apparemment vide à la recherche de {C14}Kenny{c} et "
    "{C14}Hilary{c} et finit par les retrouver prisonniers dans une cage de verre. "
    "<\f>{A5}{C12}{Q}\"{C14}Tyson{c}! Je savais que tu nous retrouverais!\" "
    "{c}<\f>{U}{a0}{C12}{q}\"Oui, et pourquoi as-tu mis autant de "
    "temps?\"{c}<\f>{u}{b}{B}{t1}{f}{C14}Gideon{c}{a19} et les {C14}hommes en noir{c}{A24} "
    "apparaissent:<\f>{C13}{q}{Q}\"Nous voulons défier {C14}Tyson{c}, le champion du monde, en "
    "combat.\"{c}<\f>{U}{u}{A10}{C12}{Q}\"Quoi? Pour de vrai? Vous voulez dire que vous avez "
    "fait tout cela pour m'attirer ici afin de me défier en combat?\" {c}<\f>{U}{q}{C13}\"Tu "
    "acceptes?\"{c}<\f>{u}{Q}{C12}\"D'accord, mais à une condition: laissez-les "
    "partir.\"{c}<\f>{U}{A23}{a24}{Q}{q}{C13}\"Très bien. Nous allons libérer tes amis. Mais "
    "seulement si tu gagnes.{f4}\"{c}",
    "{C14}Takao{c} esplora la nave, apparentemente vuota, alla ricerca del {C14}Prof. Kappa{c} e "
    "di {C14}Hilary{c}. Alla fine, li trova rinchiusi in una gabbia di "
    "vetro.<\f>{A5}{C12}{Q}\"{C14}Takao{c}! Sapevo che ce l'avresti fatta!\" "
    "{c}<\f>{U}{a0}{C12}{q}\"Già. Perché ci hai messo tanto?\"{c}<\f>{u}{b}{B}{t1}Appaiono "
    "{f}{C14}Gideon{c}{a19} e gli {C14}uomini vestiti di "
    "nero{c}{A24}...<\f>{C13}{q}{Q}\"Vogliamo sfidare in battaglia {C14}Takao{c}, il campione "
    "del mondo.\"{c}<\f>{U}{u}{A10}{C12}{Q}\"Cosa? Ma state scherzando? Avete fatto tutto questo "
    "soltanto per sfidarmi?\" {c}<\f>{U}{q}{C13}\"Accetti?\"{c}<\f>{u}{Q}{C12}\"Sì, ma a una "
    "condizione: che loro siano liberati.\"{c}<\f>{U}{A23}{a24}{Q}{q}{C13}\"Molto bene. "
    "Libereremo i tuoi amici, ma solo se vincerai.{f4}\"{c}",
};

static const unk8* _806A498[5] = {
    "{A10}{C14}Tyson's{c} Dragoon rips into his {f}{C14}Robot{c}{a26} "
    "opponent.<\f>{A5}{a0}{Q}{C12}\"Someone's inputting {C14}Tyson's{c} attack patterns into the "
    "{C14}Robot's{c} strategy chip!\"{c}<\f>{U}{q}{C12}\"But then... he doesn't stand a "
    "chance!\"{c}<\f>{u}{b}{B}{C14}Tyson{c} is losing badly. Eventually he releases his Bit "
    "Beast in a final attempt to win. <\f>{A19}{Q}{C13}\"NOW! Capture the Bit "
    "Beast!\"{c}<\f>{U}{A23}{a24}{Q}{q}{C13}\"Bit Beast capture program "
    "operational.\"{c}<\f>{u}{U}{b}{B}{a26}{q}The {C14}Robot{c} opponent's eyes suddenly shoot "
    "lasers, which seem to be capturing {C14}Tyson's{c} Bit Beast. "
    "<\f>{u}{A10}{Q}{C12}\"Dragoon!\" {c}<\f>{U}{b}{B}{t3}Dragoon manages to break free from the "
    "laser attack. The {C14}Robot{c} shorts out and explodes...<\f>{A19}{Q}{C13}\"No!!\" "
    "{c}<\f>{U}{B}The glass cage opens up and lets {C14}Kenny{c} and {C14}Hilary{c} free. They "
    "help the victorious {C14}Tyson{c} out on to the shore.<\f>{t1}Back on the ship, "
    "{C14}Gideon{c}{A19} is laughing to himself...<\f>{Q}{C13}\"Now I know the secret - the "
    "secret of the Bit Beast.\" {c}",
    "{A10}El dragón de {C14}Tyson{c} sale disparado contra su adversario "
    "{f}{C14}Robot{c}{a26}<\f>{A5}{a0}{Q}{C12}\"¡Alguien está introduciendo los patrones de "
    "ataque de {C14}Tyson{c} en el chip de estrategia del {C14}Robot{c}!\"{c}<\f> "
    "{U}{q}{C12}\"Pero en ese caso... No tiene ninguna oportunidad\"{c}<\f> "
    "{u}{b}{B}{C14}Tyson{c} está perdiendo miserablemente; por fin, libera a su Bit Beast, en un "
    "último intento de vencer. <\f>{A19}{Q}{C13}\"¡AHORA! ¡Captura al Bit Beast!\"{c}<\f> "
    "{U}{A23}{a24}{Q}{q}{C13}\" Programa de captura de Bit Beast operativo \" "
    "{c}<\f>{U}{u}{b}{B}{a26}{q}De repente el {C14}Robot{c} adversario lanza láser por sus ojos, "
    "que parecen capturar al Bit Beast de {C14}Tyson{c}. {u}<\f>{A10}{Q}{C12}\"¡Dragón!\" "
    "{c}<\f>{U}{b}{B}{t3}Dragón consigue liberarse del ataque laser, y el {C14}Robot{c} sufre un "
    "cortocircuito y explota...<\f>{A19}{Q}{C13}\"¡¡No!!\" {c}<\f>{U}{B}la jaula de cristal se "
    "abre y deja libres a {C14}Kenny{c} y a {C14}Hilary{c}, que ayudan a salir al vencedor "
    "{C14}Tyson{c} a la costa.<\f>{t1}De Nuevo en el barco, {C14}Gideon{c}{A19} se ríe para sí "
    "mismo...<\f>{Q}{C13}\"Ahora sé el secreto. El secreto del Bit Beast.\" {c} ",
    "{A10}{C14}Tyson{c}s Dragoon rammt das Blade seines "
    "{f}{C14}Roboter{c}{a26}-Gegners.<\f>{A5}{a0}{Q}{C12}\"Irgendjemand transferiert "
    "{C14}Tysons{c} Angriffsmuster in den Strategie-Chip des {C14}Roboters{c}!\"{c}<\f> "
    "{U}{q}{C12}\"Aber dann... dann hat er ja überhaupt keine Chance!\"{c}<\f> "
    "{u}{b}{B}{C14}Tyson{c} steht kurz vor einer vernichtenden Niederlage. Dann wirft er als "
    "letztes Mittel sein Bit Beast in die Schlacht. <\f>{A19}{Q}{C13}\"JETZT! Greift euch das "
    "Bit Beast!\"{c}<\f> {U}{A23}{a24}{Q}{q}{C13}\"Programm zur Gefangennahme des Bit Beasts "
    "funktionsbereit.\" {c}<\f>{U}{u}{b}{B}{a26}{q}Aus den Augen des {C14}Roboter{c}-Gegners "
    "schießen plötzlich Laserstrahlen, die {C14}Tysons{c} Bit Beast einzufangen scheinen. "
    "{u}<\f>{A10}{Q}{C12}\"Dragoon!\" {c}<\f>{U}{b}{B}{t3}Dragoon schafft es, sich den "
    "Laserattacken zu entziehen, der {C14}Roboter{c} erleidet einen Kurzschluss und "
    "explodiert...<\f>{A19}{Q}{C13}\"Nein!\" {c}<\f>{U}{B}Der Glaskäfig öffnet sich! "
    "{C14}Kenny{c} und {C14}Hilary{c} sind frei. Sie helfen dem siegreichen {C14}Tyson{c}, zum "
    "Ufer zurück zu kommen.<\f>{t1}Auf dem Schiff lacht {C14}Gideon{c}{A19} sich derweil ins "
    "Fäustchen...<\f>{Q}{C13}\"Jetzt kenne ich das Geheimnis. Das Geheimnis des Bit Beasts!\" "
    "{c} ",
    "Le Dragoon de {A10}{C14}Tyson{c} attaque son adversaire "
    "{f}{C14}Robot{c}{a26}.<\f>{A5}{a0}{Q}{C12}\"Quelqu'un insère les schémas d'attaque de "
    "{C14}Tyson{c} dans la puce de stratégie du {C14}Robot{c}!\"{c}<\f> {U}{q}{C12}\"Mais "
    "alors... Il n'a pas la moindre chance.\"{c}<\f> {u}{b}{B}{C14}Tyson{c} perd et finit par "
    "libérer son Bit Beast dans une dernière tentative.<\f>{A19}{Q}{C13}\"MAINTENANT! Capturez "
    "le Bit Beast!\"{c}<\f> {U}{A23}{a24}{Q}{q}{C13}\"Programme de capture de Bit Beast "
    "opérationnel.\" {c}<\f>{U}{u}{b}{B}{a26}{q}Les yeux de l'adversaire robotisé lancent "
    "soudain des lasers qui semblent capturer le Bit Beast de {C14}Tyson{c}. "
    "{u}<\f>{A10}{Q}{C12}\"Dragoon!\" {c}<\f>{U}{b}{B}{t3}Dragoon parvient à se libérer de "
    "l'attaque des lasers et le {C14}Robot{c} entre en court circuit et "
    "explose...<\f>{A19}{Q}{C13}\"Non!\" {c}<\f>{U}{B}La cage de verre s'ouvre et libère "
    "{C14}Kenny{c} et {C14}Hilary{c} qui aident {C14}Tyson{c}, victorieux, à regagner la "
    "côte.<\f>{t1}Sur le bateau, {C14}Gideon{c}{A19} rit néanmoins...<\f>{Q}{C13}\"Maintenant, "
    "je connais le secret. Le secret du Bit Beast.\" {c} ",
    "Il Dragoon di {A10}{C14}Takao{c} lotta contro il suo avversario "
    "{f}{C14}Robot{c}{a26}.<\f>{A5}{a0}{Q}{C12}\"Qualcuno sta comunicando gli schemi di attacco "
    "di {C14}Takao{c} al chip strategico del {C14}Robot{c}!\"{c}<\f> {U}{q}{C12}\"Ma allora... "
    "non ha speranze!\"{c}<\f> {u}{b}{B}{C14}Takao{c} sta nettamente perdendo. Per cercare di "
    "vincere, fa intervenire il suo Bit Beast.<\f>{A19}{Q}{C13}\"ORA! Catturate il Bit "
    "Beast!\"{c}<\f> {U}{A23}{a24}{Q}{q}{C13}\"Programma di cattura del Bit Beast operativo.\" "
    "{c}<\f>{U}{u}{b}{B}{a26}{q}Subito, gli occhi dell'avversario {C14}Robot{c} proiettano dei "
    "raggi laser che sembrano capaci di catturare il Bit Beast di "
    "{C14}Takao{c}.{u}<\f>{A10}{Q}{C12}\"Dragoon!\" {c}<\f>{U}{b}{B}{t3}Il Dragoon riesce a "
    "liberarsi dai laser e il {C14}Robot{c} va in corto circuito ed "
    "esplode...<\f>{A19}{Q}{C13}\"No!!\" {c}<\f>{U}{B}La gabbia di vetro si apre e lascia uscire "
    "il {C14}Prof. Kappa{c} e {C14}Hilary{c}, che aiutano il vittorioso {C14}Takao{c} a "
    "raggiungere la riva.<\f>{t1}A bordo della nave, {C14}Gideon{c}{A19} ride fra sé. "
    "<\f>{Q}{C13}\"Ora conosco il segreto. Il segreto del Bit Beast.\" {c} ",
};

static const unk8* _806A4AC[5] = {
    "{A5}{C14}Kenny{c} and {a10}{C14}Tyson{c} are trying to understand what "
    "is going on...<\f>The best they can deduce is that two factions are "
    "trying to steal the Bladebreakers' Bit Beasts.<\f>{Q}{C12}\"Wait a "
    "minute! I just had a horrible thought! What if that creep {C14}Ozuma{c} "
    "is after all the Bit Beasts from everyone in the Bladebreakers?<\f>That "
    "means they'll be going after {C14}Kai{c} to get his next!!\"{c}",
    "{A5}{C14}Kenny{c} y {a10}{C14}Tyson{c} están intentando comprender lo "
    "que está ocurriendo... lo máximo que han podido deducir es que dos "
    "facciones están intentando robar los Bit Beast de los "
    "Bladebreakers<\f>{Q}{C12}\"¡Un minuto! ¡Acabo de tener una idea "
    "horrible! ¿Y si ese gusano de {C14}Ozuma{c} quiere hacerse con todos los "
    "Bit Beast de todos los Bladebreakers? ¡¡Eso significa que tendría que ir "
    "a por Kai para conseguir el siguiente!!\"{c}",
    "{A5}{C14}Kenny{c} und {a10}{C14}Tyson{c} versuchen zu verstehen, was vor "
    "sich geht... sie kommen zu dem Schluss, dass es zwei Fraktionen geben "
    "muss, die versuchen, die Bit Beasts der Bladebreakers zu "
    "stehlen.<\f>{Q}{C12}\"Warte mal! Mir kam da gerade ein ganz furchtbarer "
    "Gedanke! Und wenn dieser Widerling {C14}Ozuma{c} die Bit Beasts aller "
    "Bladebreakers stehlen will? Das würde bedeuten, dass er als nächstes "
    "{C14}Kai{c} aufsuchen wird, um ihm seins abzunehmen!\"{c}",
    "{A5}{C14}Kenny{c} et {a10}{C14}Tyson{c} tentent de comprendre ce qui se "
    "passe... Ils ne parviennent qu'à déduire que deux factions essaient de "
    "voler les Bit Beasts des Bladebreakers.<\f>{Q}{C12}\"Une minute! Je "
    "viens d'avoir une idée épouvantable: et si cet {C14}Ozuma{c} en voulait "
    "aux Bit Beasts de tous les Bladebreakers? Cela voudrait dire que "
    "{C14}Kai{c} est la prochaine cible!\"{c}",
    "{A5}Il {C14}Prof. Kappa{c} e {a10}{C14}Takao{c} stanno cercando di capire che cosa stia "
    "succedendo. La loro ipotesi più verosimile è che esistano due fazioni decise a rubare i Bit "
    "Beast dei Bladebreakers.<\f>{Q}{C12}\"Un momento! Mi è venuta un'idea angosciante! E se "
    "quel verme di {C14}Ozuma{c} fosse deciso a rubare tutti i Bit Beast dei Bladebreakers? Ciò "
    "significa che dopo sfiderà {C14}Kay{c} per rubare il suo!\"{c}",
};

static const unk8* _806A4C0[5] = {
    "{f}{A3}{C14}Kai{c} is back at school, and is challenged by {f}{C14}Dunga{c}.{f4}{a1}<\f>The "
    "battle remarkably ends in a draw, so {C14}Kai{c} decides he needs to go and find "
    "{C14}Tyson{c} to get the Bladebreakers back together. Meanwhile... <\f>{b}{B}{t1}In "
    "{C14}Gideon's{c} training center, a new blader has been chosen to be used as bait to "
    "collect data on {C14}Tyson's{c} Bit Beast in a battle. <\f>{f}{C14}Snakey{c}{a28} has his "
    "blade fitted with a magtram, which is a magnetic field generator that will give him an "
    "advantage.<\f>{C14}Snakey{c} eventually meets up with {C14}Tyson{c} {A10}and their blades "
    "crash.<\f>{Q}{C12}\"NO!\"{c}<\f>{U}{q}{C13}\"Yeah!\" {c}",
    "{f}{A3}{C14}Kai{c} ha vuelto a la escuela, y ha sido retado por {f}{C14}Dunga{c}{f4}{a1} "
    "<\f>La batalla termina, de manera excepcional, así que {C14}Kai{c} decide que necesita "
    "encontrar a {C14}Tyson{c} para reunir de Nuevo a los Bladebreakers... mientras tanto "
    "<\f>{b}{B}{t1}En el centro de entrenamiento de {C14}Gideon{c}, una nueva peonza ha sido "
    "elegida como cebo para obtener datos de la Bit Beast de {C14}Tyson{c} en una batalla. "
    "<\f>{f}{C14}Snakey{c}{a28} ha hecho instalar un Magtram en su peonza, que es un generador "
    "de campo magnético que le dará ventaja. {C14}Snakey{c} se encuentra por fin con "
    "{C14}Tyson{c} {A10} y sus peonzas chocan.<\f>{Q}{C12}\"NO\"{c}<\f>{U}{q}{C13}\"Sí\" {c}",
    "{f}{A3}{C14}Kai{c} ist zurück in der Schule und wird von {f}{C14}Dunga{c}{f4} "
    "herausgefordert. {a1} <\f>Der Kampf endet erstaunlicherweise unentschieden, so dass "
    "{C14}Kai{c} sich entschließt, {C14}Tyson{c} zu suchen und die Bladebreakers wieder zusammen "
    "zu bringen. Währenddessen... <\f>{b}{B}{t1}In {C14}Gideons{c} Trainingszentrum wird ein "
    "neuer Blader als Köder ausgewählt, um während eines Kampfes Daten über {C14}Tysons{c} Bit "
    "Beast zu sammeln. <\f>{f}{C14}Snakeys{c}{a28} Blade ist mit einem Magtram, einem "
    "magnetischen Feldgenerator, ausgestattet, der ihm einen Vorteil verschafft. {C14}Snakey{c} "
    "und {C14}Tyson{c} {A10} treffen sich schließlich... und schon bald krachen ihre Blades "
    "aufeinander.<\f>{Q}{C12}\"NEIN!!!\"{c}<\f>{U}{q}{C13}\"Yeah!\" {c}",
    "{f}{A3}{C14}Kai{c}, de retour à l'école, est défié par {f}{C14}Dunga{c}{f4}{a1}.<\f>Le "
    "combat s'achève par un match nul et {C14}Kai{c} décide d'aller retrouver {C14}Tyson{c} afin "
    "que les Bladebreakers soient de nouveau réunis...<\f>{b}{B}{t1}Pendant ce temps, au centre "
    "d'entraînement de {C14}Gideon{c}, un nouveau blader a été choisi en tant qu'appât pour "
    "rassembler des données sur le Bit Beast de {C14}Tyson{c} lors d'un combat. "
    "<\f>{f}{C14}Snakey{c}{a28} a équipé son Beyblade d'un magtram, un générateur de champ "
    "magnétique qui lui donnera l'avantage. {C14}Snakey{c} rencontre finalement {C14}Tyson{c} "
    "{A10}et leurs Beyblades s'affrontent.<\f>{Q}{C12}\"NON!\"{c}<\f>{U}{q}{C13}\"Si.\" {c}",
    "{f}{A3}{C14}Kay{c} è tornato a scuola e viene sfidato da {f}{C14}Dunga{c}{f4}{a1}.<\f>La "
    "partita si conclude con un sorprendente pareggio, così {C14}Kay{c} decide di parlare con "
    "{C14}Takao{c} per riunire i Bladebreakers. Intanto...<\f>{b}{B}{t1}Nel centro di "
    "addestramento di {C14}Gideon{c}, è stato scelto un nuovo Beyblader come esca per "
    "raccogliere informazioni sul Bit Beast di {C14}Takao{c} in "
    "battaglia.<\f>{f}{C14}Snakey{c}{a28} ha installato sul suo Beyblade un Magtram, ovvero un "
    "generatore di campo magnetico, per essere in vantaggio. {C14}Snakey{c} quindi affronta "
    "{C14}Takao{c} {A10} e i loro Beyblade si urtano "
    "violentemente.<\f>{Q}{C12}\"NO!\"{c}<\f>{U}{q}{C13}\"Sì!\" {c}",
};

static const unk8* _806A4D4[5] = {
    "Just as {C14}Tyson{c}{A10} begins to lose, {C14}Kai{c}{a3} turns up and "
    "gives some much needed moral support.<\f>{t3}{q}{C12}\"Come on, "
    "{C14}Tyson{c}, you can do this!\" {c}<\f>{u}{C14}Tyson{c}, now with a "
    "new level of determination, manages to turn the battle around...",
    "Justo cuando {C14}Tyson{c}{A10} comienza a perder, aparece "
    "{C14}Kai{c}{a3} para ofrecer un apoyo moral muy "
    "necesario.<\f>{t3}{q}{C12}\"¡Vamos, {C14}Tyson{c}, tú puedes hacerlo!\" "
    "{c}<\f>{u}{C14}Tyson{c}, ahora con una nueva determinación, consigue dar "
    "la vuelta a la tortilla...",
    "Gerade als {C14}Tyson{c}{A10} drauf und dran ist zu verlieren, erscheint "
    "{C14}Kai{c}{a3} und versucht, seinem Freund Mut zu "
    "machen.<\f>{t3}{q}{C12}\"Komm schon, {C14}Tyson{c}! Du kannst es "
    "schaffen!\" {c}<\f>{u}{C14}Tyson{c} hat neuen Mut geschöpft und schafft "
    "es, das Ruder herumzureißen...",
    "Juste au moment où {C14}Tyson{c}{A10} commence à perdre, {C14}Kai{c}{a3} "
    "arrive et vient le soutenir "
    "moralement.<\f>{t3}{q}{C12}\"Allez,{C14}Tyson{c}, tu peux y arriver!\" "
    "{c}<\f>{u}{C14}Tyson{c}, plus déterminé que jamais, parvient à retourner "
    "le combat en sa faveur...",
    "Non appena {C14}Takao{c}{A10} inizia a perdere, appare {C14}Kay{c}{a3} a "
    "fornirgli sostegno morale.<\f>{t3}{q}{C12}\"Avanti, {C14}Takao{c}, puoi "
    "farcela!\" {c}<\f>{u}{C14}Takao{c}, con rinnovata determinazione, riesce "
    "a capovolgere le sorti della battaglia...",
};

static const unk8* _806A4E8[5] = {
    "At {C14}Gideon{c}{A19}'s training facility...<\f>{t1}{Q}{C13}\"My plan involves all the "
    "Bladebreakers, not just {C14}Tyson{c}. Get all four Bladebreakers together and do it now!\" "
    "{c}<\f>{U}{a23}{q}{C13}\"But how do we do that, Mr. {C14}Gideon{c}?\" {c}<\f>{u}{b}{B}One "
    "of {C14}Gideon's{c} henchmen, {f}{C14}Doctor B{c}{a16}, is in a meeting with the head of "
    "the BBA, {C14}Mr. Dickenson{c}{A25}...<\f>{t3}{q}{C13}\"Tournaments are a waste of time, "
    "{C14}Mr. Dickenson{c}. I want to go straight to the top and hold a one-on-one match "
    "against...\"{c} <\f>{u}{Q}{C12}\"Team Bladebreakers?\" {c}<\f>{U}{q}{C13}\"Precisely!\" "
    "{c}<\f>{u}It seems {C14}Doctor B's{c} team, Psykick, will be responsible for reuniting the "
    "Bladebreakers.",
    "En las instalaciones de entrenamiento de {C14}Gideon{c}{A19}...<\f>{t1}{Q}{C13}\"Mi plan "
    "implica a todos los Bladebreakers, no solo a {C14}Tyson{c}; reunid a los cuatro "
    "Bladebreakers y hacedlo ahora\" {c}<\f>{U}{a23}{q}{C13}\"¿Pero cómo lo hacemos, Sr. "
    "{C14}Gideon{c}?\" {c}<\f>{u}{b}{B}Uno de los secuaces de {C14}Gideon{c}, el {f}{C14}Doctor "
    "B{c}{a16}, está en una reunión con el director de la ABP, el {C14}Sr. "
    "Dickenson{c}{A25}...<\f>{t3}{q}{C13}\"Los torneos son una pérdida de tiempo, {C14}Sr. "
    "Dickenson{c}. Quiero ir directamente a la cima y mantener un encuentro uno contra "
    "uno\"{c}<\f>{u}{Q}{C12}\"¿El equipo de los Bladebreakers?\" "
    "{c}<\f>{U}{q}{C13}\"Precisamente\" {c}<\f>{u}Parece que el equipo del {C14}Doctor B{c}, los "
    "Psyckick, se encargarán de reunir a los Bladebreakers.",
    "In {C14}Gideons{c}{A19} Trainingszentrum...<\f>{t1}{Q}{C13}\"Mein Plan schließt alle "
    "Bladebreakers mit ein, nicht nur {C14}Tyson{c}. Bringt alle vier Bladebreakers zusammen, "
    "und zwar sofort.\" {c}<\f>{U}{a23}{q}{C13}\"Aber wie sollen wir das anstellen, Mr. "
    "{C14}Gideon?{c}\" {c}<\f>{u}{b}{B}Einer von {C14}Gideons{c} Gefolgsleuten, {f}{C14}Doctor "
    "B{c}{a16}, trifft sich mit dem Vorsitzenden der BBA, {C14}Mr. "
    "Dickenson{c}{A25}...<\f>{t3}{q}{C13}\"Einfache Wettkämpfe sind reine Zeitverschwendung, "
    "{C14}Mr. Dickenson{c}. Ich möchte gleich zur Sache kommen und ein Match Mann-gegen-Mann "
    "austragen.\"{c}<\f>{u}{Q}{C12}\"Das Team der Bladebreakers?\" {c}<\f>{U}{q}{C13}\"Exakt!\" "
    "{c}<\f>{u}Es scheint, als wäre {C14}Doctor B's{c} Team Psykick verantwortlich für die "
    "erneute Zusammenkunft der Bladebreakers.",
    "Au centre d'entraînement de {C14}Gideon{c}{A19}...<\f>{t1}{Q}{C13}\"Mon plan concerne tous "
    "les Bladebreakers, pas seulement {C14}Tyson{c}. Rassemblez les quatre Bladebreakers et "
    "agissez sur-le-champ.\" {c}<\f>{U}{a23}{q}{C13}\"Mais comment faire, M. {C14}Gideon{c}?\" "
    "{c}<\f>{u}{b}{B}Le {f}{C14}docteur B{c}{a16}, l'un des hommes de main de {C14}Gideon{c}, "
    "est en conférence avec le chef de la BBA, {C14}M. Dickenson{c}{A25}...<\f>{t3}{q}{C13}\"Les "
    "tournois sont une perte de temps, {C14}M. Dickenson{c}. Je veux taper directement au sommet "
    "et affronter en combat singulier\"{c}<\f>{u}{Q}{C12}\"L'équipe des Bladebreakers?\" "
    "{c}<\f>{U}{q}{C13}\"Précisément.\" {c}<\f>{u}On dirait que l'équipe Psykick du {C14}docteur "
    "B{c} va entraîner la réunification des Bladebreakers.",
    "Presso il centro di addestramento di {C14}Gideon{c}...<\f>{t1}{Q}{C13}\"Il mio piano "
    "riguarda tutti i Bladebreakers, non solo {C14}Takao{c}. Riunite tutti i quattro "
    "Bladebreakers, e subito!\" {c}<\f>{U}{a23}{q}{C13}\"Ma come potremo farcela, signor "
    "{C14}Gideon{c}?\" {c}<\f>{u}{b}{B}Uno degli scagnozzi di {C14}Gideon{c}, il {f}{C14}Dottor "
    "B{c}{a16}, è in riunione con il direttore della BBA, {C14}Mr. "
    "Dickenson{c}{A25}...<\f>{t3}{q}{C13}\"I tornei sono uno spreco di tempo, {C14}Mr. "
    "Dickenson{c}. Voglio andare al sodo e organizzare un incontro "
    "diretto.\"{c}<\f>{u}{Q}{C12}\"Riunendo i Bladebreakers?\" "
    "{c}<\f>{U}{q}{C13}\"Precisamente.\" {c}<\f>{u}Sembra che la squadra Psykicks del "
    "{C14}Dottor B{c} si occuperà di riunire i Bladebreakers.",
};

static const unk8* _806A4FC[5] = {
    "{C14}Mr. Dickenson{c}{A25} has arranged for the Bladebreakers to reunite for the upcoming "
    "challenge. <\f>{t3}{Q}{C12}\"Thank you for coming all this "
    "way.\"{c}<\f>{U}{a6}{q}{C12}\"It's no problem, sir. I'm really psyched to be back with the "
    "team again!\" {c}<\f>{u}{b}{B}The Breakers, now finally together again, go into training "
    "with their newly adapted blades. <\f>{C14}Kenny{c} has learned about the Magtram that "
    "{C14}Snakey{c} used and adapted the technology into the MG core which he has fitted to all "
    "of the team's blades. The blades are so different to handle for {C14}Tyson{c} and the "
    "others that it's almost like having to learn again from scratch.",
    "El {C14}Sr. Dickenson{c}{A25} ha concertado una reunión de los Bladebreakers para el "
    "próximo encuentro <\f>{t3}{Q}{C12}\"Gracias por venir desde tan "
    "lejos.\"{c}<\f>{U}{a6}{q}{C12}\"No es problema, señor. ¡Estoy realmente encantado de volver "
    "de nuevo con el equipo!\" {c}<\f>{u}{b}{B}Los Breakers por fin otra vez juntos van a "
    "entrenarse con sus peonzas recién adaptadas, <\f>{C14}Kenny{c} ha aprendido sobre el "
    "Magtram que {C14}Snakey{c} usó y ha adaptado la tecnología al núcleo del EM que ha incluido "
    "en todas las peonzas del equipo. Las peonzas son tan distintas en su manejo que, para "
    "{C14}Tyson{c} y los demás, es casi como aprender otra vez desde cero.",
    "{C14}Mr. Dickenson{c}{A25} hat die Bladebreakers für die bevorstehende Herausforderung "
    "zusammengerufen. <\f>{t3}{Q}{C12}\"Danke, dass ihr alle gekommen "
    "seid.\"{c}<\f>{U}{a6}{q}{C12}\"Kein Problem, Sir. Gibt nichts Aufregenderes, als wieder im "
    "Team zu sein!\" {c}<\f>{u}{b}{B}Die wiedervereinigten Breakers widmen sich dem gemeinsamen "
    "Training mit ihren neuen Blades. <\f>{C14}Kenny{c} hat sich über die Funktionsweise von "
    "diesem Magtram informiert, das {C14}Snakey{c} benutzt hat. Er hat diese Technologie in die "
    "MG-Kerne der Blades aller Teammitglieder eingebaut. Die neuen Blades sind dermaßen anders "
    "zu handhaben, dass es {C14}Tyson{c} und den anderen vorkommt, als müssten sie alles noch "
    "einmal lernen.",
    "{C14}M. Dickenson{c}{A25} a arrangé la réunification des Bladebreakers pour le défi à "
    "venir. <\f>{t3}{Q}{C12}\"Merci d'avoir tous accepté.\"{c}<\f>{U}{a6}{q}{C12}\"Pas de "
    "problème. C'est vraiment super de se retrouver avec toute l'équipe!\" {c}<\f>{u}{b}{B}Les "
    "Breakers, de nouveau réunis, commencent à s'entraîner avec leurs Beyblades récemment "
    "modifiés.<\f>{C14}Kenny{c} a découvert l'existence du Magtram employé par {C14}Snakey{c} et "
    "a adapté cette technologie au MG Core qu'il a installé sur les Beyblades de toute l'équipe. "
    "Le comportement des Beyblades est tellement modifié que {C14}Tyson{c} et les autres ont "
    "presque l'impression de devoir tout réapprendre.",
    "{C14}Mr. Dickenson{c}{A25} ha organizzato la riunione dei Bladebreakers per la futura "
    "sfida.<\f>{t3}{Q}{C12}\"Grazie per essere venuti tutti fin "
    "qui.\"{c}<\f>{U}{a6}{q}{C12}\"Nessun problema, signore. Sono veramente entusiasta di essere "
    "tornato nella squadra!\" {c}<\f>{u}{b}{B}I Bladebreakers finalmente riuniti, si recano in "
    "addestramento con i loro Beyblade appena adattati.<\f>Il {C14}Prof. Kappa{c} ha saputo del "
    "Magtram usato da {C14}Snakey{c} e ha inserito la stessa tecnologia nel nucleo magnetico di "
    "tutti i Beyblade della squadra. Il loro comportamento è così diverso che {C14}Takao{c} e "
    "gli altri devono praticamente ricominciare da zero.",
};

static const unk8* _806A510[5] = {
    "{A6}{Q}{C12}\"Come on, guys! The bus is here!\"{c}<\f>{U}{B}It's early in the morning and "
    "the bus is waiting outside to take the Bladebreakers to the match. <\f>{A10}{Q}{C12}\"All "
    "right, let's go! The Bladebreakers are back!\"{c}<\f>{U}{B}As the bus pulls away, the "
    "{f}{C14}bus driver{c}{a12} flicks a small switch that releases gas into the area of the bus "
    "that the Breakers and {C14}Hilary{c} are occupying.<\f>{q}{C13}\"Nighty night, kids. That "
    "should put them to sleep for a couple of hours.\"{c}<\f>{u}{b}When the Bladebreakers wake "
    "up, they find themselves on a strange island.<\f>{A0}{Q}{C12}\"Where are "
    "we?\"{c}<\f>{U}{t1}{a16}{q}{C13}\"There is no escape... We've arranged for you to battle "
    "one-on-one with Team Psykick.\" {c}<\f>{u}{A10}{Q}{C12}\"Wait a sec!! We were already on "
    "our way to fight the Psykicks this morning when you trapped us "
    "here!\"{c}<\f>{U}{q}{C13}\"Silence! Say hello to "
    "{C14}Chameleon{c}.\"{c}<\f>{u}{f}{a13}{B}{t2}{q}{C13}\"Alright! Game on!\" "
    "{c}<\f>{u}{A6}{Q}{C12}\"Let it Rip{f4}!!\"{c}",
    "{A6}{Q}{C12}\"¡Vamos, chicos, el autobús está aquí!\"{c}<\f>{U}{B}Es temprano, y el autobús "
    "está esperando fuera para llevar a los Bladebreakers al encuentro. <\f>{A10}{Q}{C12}\"¡De "
    "acuerdo, vamos! ¡Los Bladebreakers han vuelto!\"{c}<\f>{U}{B}Mientras el autobús se aleja, "
    "el {f}{C14}conductor{c}{a12} acciona un pequeño interruptor que libera gas en el área del "
    "autobús que ocupan los Breakers y {C14}Hilary.{c}<\f>{q}{C13}\"Dulces sueños, chicos; eso "
    "debería hacerles dormir durante un par de horas\"{c}<\f>{u}{b}Cuando los Bladebreakers "
    "despiertan, se encuentran en una extraña isla<\f>{A0}{Q}{C12}\"¿Dónde "
    "estamos?\"{c}<\f>{U}{t1}{a16}{q}{C13}\"No hay escapatoria... Lo hemos arreglado todo para "
    "que peleéis uno contra uno con el equipo Psykick\" {c}<\f>{u}{A10}{Q}{C12}\"¡Espera un "
    "segundo! Ya veníamos a luchar contra los Psykicks esta mañana antes de que nos atraparas "
    "aquí\"{c}<\f>{U}{q}{C13}\"¡Silencio! Saludad a {C14}Camaleón{c}\"{c}<\f> "
    "{u}{f}{a13}{B}{t2}{q}{C13}\"¡De acuerdo! A jugar\" "
    "{c}<\f>{u}{A6}{Q}{C12}\"¡¡Lanza{f4}!!\"{c}",
    "{A6}{Q}{C12}\"Kommt schon, Leute. Der Bus ist da!\"{c}<\f>{U}{B}Es ist früh am Morgen und "
    "der Bus wartet draußen, um die Bladebreakers zum Match zu bringen. <\f>{A10}{Q}{C12}\"OK, "
    "lasst uns aufbrechen! Die Bladebreakers sind zurück!\"{c}<\f>{U}{B}Als der Bus losfährt, "
    "legt der {f}{C14}Busfahrer{c}{a12} einen kleinen Schalter um, und Gas dringt in den "
    "Businnenraum mit {C14}Hilary{c} und den Bladebreakers. <\f>{q}{C13}\"Träumt schön, Kinder. "
    "Das sollte sie für einige Stunden schlafen lassen!\"{c}<\f>{u}{b}Als die Bladebreakers "
    "aufwachen, stellen sie fest, dass sie sich auf einer seltsamen Insel befinden. "
    "<\f>{A0}{Q}{C12}\"Wo sind wir?\"{c}<\f>{U}Plötzlich erscheint {C14}Doctor "
    "B{c}.{t1}{a16}{q}{C13}\"Es gibt kein Entkommen... Ihr werdet hier gegen Team Psykick "
    "antreten, in einem Kampf Mann-gegen-Mann. \" {c}<\f>{u}{A10}{Q}{C12}\"Moment mal! Wir waren "
    "heute Morgen doch gerade auf dem Weg, um gegen die Psykicks zu kämpfen, als ihr uns "
    "gefangen genommen habt! \"{c}<\f>{U}{q}{C13}\"Schweigt! Und begrüßt "
    "{C14}Chamäleon{c}!\"{c}<\f> {u}{f}{a13}{B}{t2}{q}{C13}\"OK! Der Kampf kann beginnen.\" "
    "{c}<\f>{u}{A6}{Q}{C12}\"Let it rip{f4}!\"{c}",
    "{A6}{Q}{C12}\"Allez, le bus est là!\"{c}<\f>{U}{B}Il est très tôt et le bus attend les "
    "Bladebreakers pour les amener au match. <\f>{A10}{Q}{C12}\"Très bien, en route! Les "
    "Bladebreakers sont de retour!\"{c}<\f>{U}{B}Tandis que le bus s'éloigne, son "
    "{f}{C14}conducteur{c}{a12} actionne un interrupteur qui libère du gaz dans le compartiment "
    "qu'occupent les Breakers et {C14}Hilary{c}. <\f>{q}{C13}\"Faites de beaux rêves, les "
    "enfants. Voilà qui devrait les faire dormir pendant plusieurs heures.\"{c}<\f>{u}{b}A leur "
    "réveil, les Bladebreakers se retrouvent sur une curieuse île.<\f>{A0}{Q}{C12}\"Où "
    "sommes-nous?\"{c}<\f>{U}{t1}{a16}{q}{C13}\"Impossible de fuir d'ici... Nous avons arrangé "
    "un combat au sommet entre vous et l'équipe Psykick.\" {c}<\f>{u}{A10}{Q}{C12}\"Une minute! "
    "Nous étions en route pour affronter les Psykicks lorsque vous nous avez amenés "
    "ici.\"{c}<\f>{U}{q}{C13}\"Silence! Dites bonjour à {C14}Chameleon{c}\"{c}<\f> "
    "{u}{f}{a13}{B}{t2}{q}{C13}\"Très bien! Commencons.\" {c}<\f>{u}{A6}{Q}{C12}\"Hyper vitesse "
    "{f4}!\"{c}",
    "{A6}{Q}{C12}\"Avanti, ragazzi, l'autobus è arrivato!\"{c}<\f>{U}{B}È prima mattina e "
    "l'autobus è in attesa dei Bladebreakers, per condurli sul luogo della "
    "sfida.<\f>{A10}{Q}{C12}\"Va bene, andiamo! I Bladebreakers sono "
    "tornati!\"{c}<\f>{U}{B}Mentre l'autobus parte, il suo {f}{C14}conducente{c}{a12} aziona un "
    "piccolo interruttore che sprigiona gas all'interno, dove si trovano i Bladebreakers e "
    "{C14}Hilary{c}.<\f>{q}{C13}\"Buonanotte, ragazzi! Dovreste restare nel mondo dei sogni per "
    "un paio d'ore!\"{c}<\f>{u}{b}Quando i Bladebreakers si svegliano, si trovano su una strana "
    "isola.<\f>{A0}{Q}{C12}\"Ma dove siamo?\"{c}<\f>{U}{t1}{a16}{q}{C13}\"Non avete alternative. "
    "Per voi abbiamo organizzato una battaglia diretta con la squadra Psykicks.\" "
    "{c}<\f>{u}{A10}{Q}{C12}\"Un momento! Stamattina, noi eravamo già partiti per affrontare la "
    "squadra Psykicks... poi lei ci ha intrappolati qui!\"{c}<\f>{U}{q}{C13}\"Silenzio! Salutate "
    "{C14}Chameleon{c}.\"{c}<\f> {u}{f}{a13}{B}{t2}{q}{C13}\"Va bene! Iniziamo.\" "
    "{c}<\f>{u}{A6}{Q}{C12}\"3, 2, 1, pronti... lancio!{f4}!\"{c}",
};

static const unk8* _806A524[5] = {
    "After a ferocious battle, {C14}Max{c}{a6} managed to win by using the "
    "power of his MG Core...<\f>{t3}{A10}{Q}{C12}\"Ah man, that was sweet, "
    "{C14}Max{c}! You sure showed Lizard Boy who's boss around here!!\" "
    "{c}<\f>{U}{A0}{Q}{C12}\"Reality check, we're still trapped on this "
    "island.\"{c}{U}",
    "Tras una feroz batalla, {C14}Max{c}{a6} se las ingenió para ganar usando "
    "el poder de su núcleo EM...<\f>{t3}{A10}{Q}{C12}\"Ah, tío,¡has estado "
    "fantástico, {C14}Max{c}! ¡¡Has enseñado al Chico Lagarto quién manda "
    "aquí!!\" {c}<\f>{U}{A0}{Q}{C12}\" Volved a la realidad, ¡seguimos "
    "atrapados en esta isla!\"{c}",
    "Nach einem harten Kampf konnte {C14}Max{c}{a6} dank der Kraft seines "
    "MG-Kerns gewinnen...<\f>{t3}{A10}{Q}{C12}\"Oh, Mann! Gut gemacht, "
    "{C14}Max{c}! Du hast es der Echsenfresse ganz schön gezeigt!\" "
    "{c}<\f>{U}{A0}{Q}{C12}\"Hallo? Falls du's vergessen hast: Wir stecken "
    "immer noch auf dieser Insel fest.\"{c}",
    "Après une lutte acharnée, {C14}Max{c}{a6} a réussi à emporter la victoire grâce à la "
    "puissance de son MG Core...<\f>{t3}{A10}{Q}{C12}\"Eh, cela a été super, {C14}Max{c}! Tu as "
    "montré à ce lézard qui était le patron!\" {c}<\f>{U}{A0}{Q}{C12}\"Revenez sur terre: nous "
    "sommes toujours coincés sur cette île!\"{c}",
    "Dopo uno scontro feroce, {C14}Max{c}{a6} riesce a vincere sfruttando la "
    "potenza del suo nucleo magnetico...<\f>{t3}{A10}{Q}{C12}\"Fantastico, "
    "{C14}Max{c}, bella vittoria! Hai mostrato a quel serpente chi comanda "
    "qui!\" {c}<\f>{U}{A0}{Q}{C12}\"Restiamo coi piedi per terra: siamo "
    "ancora intrappolati su quest'isola.\"{c}",
};

static const unk8* _806A538[5] = {
    "Still stuck on the island, the Bladebreakers are trying to decide what to do "
    "next...<\f>{A5}{Q}{C12}\"Hey, look at that!\" {c}<\f>{U}{a9}{q}{C12}\"You mean the "
    "lighthouse?\"{c}<\f>{u}{Q}{C12}\"Lighthouses usually come equipped with radios, like in "
    "case of emergencies.\"{c}<\f>{U}After some heated discussion, the Breakers decide the best "
    "way to proceed is to split up.<\f>{C14}Kenny{c}, {C14}Hilary{c} and {C14}Kai{c} head for "
    "the lighthouse while the others move inland to find out more "
    "information.<\f>{B}{b}{C14}Ray{c}, {C14}Max{c} and {C14}Tyson{c} enter a cave. Once inside "
    "the pitch black, they hear a booming voice....<\f>{t1}{f}{a11}{q}{C13}\"Welcome to the "
    "stadium of darkness!!!\" {c}<\f>{u}{A6}{Q}{C12}\"Up there!\"{c}<\f>{U}Up above the "
    "Breakers, the dark emperor {C14}Bat{c} hangs upside down, staring at the Breakers beneath "
    "him...<\f>{A10}{Q}{C12}\"Come down and fight!\" {c}<\f>{U}{t2}{C14}Bat{c} jumps down, and "
    "prepares for battle... {C14}Ray{c}{A9} steps forward...<\f>{Q}{C12}\"let it Rip{f4}!!\"{c}",
    "Aún bloqueados en la isla, los Bladebreakers intentan decidir qué hacer "
    "ahora...<\f>{A5}{Q}{C12}\"Ey, ¡mira eso!\" {c}<\f>{U}{a9}{q}{C12}\"¿Te refieres al "
    "faro?\"{c}<\f>{u}{Q}{C12}\" Los faros suelen disponer de radios, para las "
    "emergencias\"{c}<\f>{U}Después de una acalorada discusión, los Breakers deciden que lo "
    "mejor es dividirse. {C14}Kenny{c}, {C14}Hilary{c} y {C14}Kai{c} se dirigen al faro, "
    "mientras que los demás se adentran para conseguir más información.<\f>{B}{b}{C14}Ray{c}, "
    "{C14}Max{c} y {C14}Tyson{c} entran en una cueva y, una vez dentro, en la más negra "
    "oscuridad, se oye una voz atronadora...<\f>{t1}{f}{a11}{q}{C13}\"¡¡¡Bienvenidos al estadio "
    "de la oscuridad!!!\" {c}<\f>{u}{A6}{Q}{C12}\"Aquí arriba\"{c}<\f> {U}Por encima de los "
    "Breakers, el oscuro {C14}murciélago emperador{c} cuelga cabeza abajo mirando a los Breakers "
    "que están abajo...<\f>{A10}{Q}{C12}\"Baja y pelea\" {c}<\f>{U}{t2}El {C14}murciélago{c} se "
    "deja caer y se prepara para la batalla...{C14}Ray{c}{A9} se adelanta... "
    "<\f>{Q}{C12}\"¡¡Lanza{f4}!!\"{c}",
    "Die Bladebreakers sind immer noch auf der Insel gefangen und beraten, was sie tun "
    "sollen...<\f>{A5}{Q}{C12}\"Schaut mal!\" {c}<\f>{U}{a9}{q}{C12}\"Du meinst den "
    "Leuchtturm?\"{c}<\f>{u}{Q}{C12}\"Leuchttürme sind normalerweise mit Funkstationen "
    "ausgestattet, für Notfälle.\"{c}<\f>{U}Nach einer hitzigen Diskussion entscheiden die "
    "Breakers, dass es das Beste sei, sich aufzuteilen. {C14}Kenny{c}, {C14}Hilary{c} und "
    "{C14}Kai{c} machen sich auf zum Leuchtturm, während die anderen die Insel erkunden und "
    "Informationen sammeln wollen.<\f>{B}{b}{C14}Ray{c}, {C14}Max{c} und {C14}Tyson{c} betreten "
    "eine Höhle. Kaum sind sie drinnen, hören sie eine dröhnende "
    "Stimme...<\f>{t1}{f}{a11}{q}{C13}\"Willkommen in der Arena der Finsternis!!!\" "
    "{c}<\f>{u}{A6}{Q}{C12}\"Da oben!\"{c}<\f> {U}Über den Breakers hängt kopfüber die dunkle "
    "Herrscher-{C14}Fledermaus{c} und betrachtet die Gruppe unter sich...<\f>{A10}{Q}{C12}\"Komm "
    "runter und kämpfe!\" {c}<\f>{U}{t2}Die {C14}Fledermaus{c} springt herab und macht sich "
    "bereit für den Kampf...{C14}Ray{c}{A9} tritt vor. <\f>{Q}{C12}\"Let it rip{f4}!\"{c}",
    "Toujours coincés sur l'île, les Bladebreakers essaient de trouver une "
    "solution...<\f>{A5}{Q}{C12}\"Eh, regardez cela!\" {c}<\f>{U}{a9}{q}{C12}\"Tu veux parler du "
    "phare?\"{c}<\f>{u}{Q}{C12}\"Les phares sont souvent équipés d'une radio pour les cas "
    "d'urgence...\"{c}<\f>{U}Après une discussion animée, les Breakers décident qu'il vaut mieux "
    "se séparer. {C14}Kenny{c}, {C14}Hilary{c} et {C14}Kai{c} se dirigent vers le phare pendant "
    "que les autres vont vers l'intérieur de l'île à la recherche "
    "d'informations.<\f>{B}{b}{C14}Ray{c}, {C14}Max{c} et {C14}Tyson{c} entrent dans une grotte "
    "et, une fois à l'intérieur, entendent une grosse voix...<\f>{t1}{f}{a11}{q}{C13}\"Bienvenue "
    "au stade des ténèbres!\" {c}<\f>{u}{A6}{Q}{C12}\"Là-haut!\"{c}<\f> {U}Au-dessus des "
    "Breakers, une {C14}chauve-souris{c} empereur est accrochée la tete en bas et les "
    "regarde...<\f>{A10}{Q}{C12}\"Viens te battre!\" {c}<\f>{U}{t2}{C14}Bat{c} saute, les "
    "rejoint et se prépare au combat... {C14}Ray{c}{A9} s'avance. <\f>{Q}{C12}\"Hyper vitesse "
    "{f4}!\"{c}",
    "I Bladebreakers, sempre intrappolati sull'isola, stanno decidendo il da "
    "farsi...<\f>{A5}{Q}{C12}\"Ehi, guarda lì!\" {c}<\f>{U}{a9}{q}{C12}\"Vuoi dire il "
    "faro?\"{c}<\f>{u}{Q}{C12}\"Di solito, i fari sono dotati di impianti radio, per le "
    "emergenze.\"{c}<\f>{U}Dopo un'animata discussione, i Bladebreakers decidono che la tattica "
    "migliore è dividersi: il {C14}Prof. Kappa{c}, {C14}Hilary{c} e {C14}Kay{c} si dirigeranno "
    "verso il faro, mentre gli altri si recheranno nell'entroterra per cercare ulteriori "
    "informazioni.<\f>{B}{b}{C14}Rey{c}, {C14}Max{c} e {C14}Takao{c} entrano in una caverna. Nel "
    "buio, odono una voce tonante...<\f>{t1}{f}{a11}{q}{C13}\"Benvenuti nello stadio delle "
    "tenebre!\" {c}<\f>{u}{A6}{Q}{C12}\"Lassù!\"{c}<\f> {U}Sopra i Bladebreakers, l'imperatore "
    "dei {C14}pipistrelli{c} è appeso al tetto e li guarda...<\f>{A10}{Q}{C12}\"Scendi e "
    "battiti!\" {c}<\f>{U}{t2}Il {C14}pipistrello{c} scende e si prepara a "
    "battersi...{C14}Rey{c}{A9} si fa avanti...<\f>{Q}{C12}\"3, 2, 1, pronti... lancio{f4}!\"{c}",
};

static const unk8* _806A54C[5] = {
    "{C14}Ray{c}{A9} uses his Driger to great effect, following the sounds of {C14}Bat{c}{a11}'s "
    "Beyblade in the darkness. Eventually {C14}Ray{c} emerges victorious.<\f>{t3}{q}{C13}\"Oh "
    "no! You defeated my Batranzer!\" {c}<\f>{u}{b}{B}As {C14}Ray{c} retrieves Driger, the "
    "ground begins to shake and the cave starts to collapse...<\f>{A6}{Q}{C12}\"There's the way "
    "out!\"{c}<\f>{U}The three escape just in time as the cave collapses...",
    "{C14}Ray{c}{A9} usa su Driger con gran acierto, siguiendo los sonidos de "
    "la peonza del {C14}murciélago{c}{a11} en la oscuridad. Finalmente, "
    "{C14}Ray{c} sale victorioso<\f>{t3}{q}{C13}\"¡Oh, no! ¡Derrotaste a mi "
    "Batranzer!\" {c}<\f>{u}{b}{B}Mientras {C14}Ray{c} recupera el Driger, el "
    "suelo comienza a temblar y la cueva empieza a "
    "derrumbarse...<\f>{A6}{Q}{C12}\"Ahí está la salida\"{c}<\f>{U}Los tres "
    "escapan justo antes de que la cueva se desplome...",
    "{C14}Ray{c}{A9} benutzt seinen Driger und orientiert sich in der Dunkelheit an den "
    "Geräuschen, um das Beyblade der {C14}Fledermaus{c}{a11} zu orten. Schließlich geht "
    "{C14}Ray{c} als Sieger aus dem Kampf hervor. <\f>{t3}{q}{C13}\"Oh, nein! Du hast meinen "
    "Batranzer zerstört!\" {c}<\f>{u}{b}{B}Als {C14}Ray{c} seinen Driger aufsammelt, beginnt der "
    "Boden zu beben - die Höhle stürzt ein...<\f>{A6}{Q}{C12}\"Da geht's nach "
    "draußen!\"{c}<\f>{U}Die drei entkommen gerade noch, bevor die Höhle endgültig kollabiert...",
    "{C14}Ray{c}{A9} utilise son Driger avec brio en suivant les bruits du "
    "Beyblade de {C14}Bat{c}{a11} dans l'obscurité. {C14}Ray{c} finit par "
    "remporter la victoire.<\f>{t3}{q}{C13}\"Oh non! Tu as vaincu mon "
    "Batranzer!\" {c}<\f>{u}{b}{B}Tandis que {C14}Ray{c} ramasse son Driger, "
    "la terre commence à trembler et la grotte se met à "
    "s'effondrer...<\f>{A6}{Q}{C12}\"Voilà la sortie!\"{c}<\f>{U}Tous trois "
    "s'échappent de justesse alors que la grotte s'écroule...",
    "{C14}Rey{c}{A9} usa molto efficacemente il suo Driger, seguendo il suono "
    "del Beyblade del {C14}pipistrello{c}{a11} nelle tenebre. Alla fine, la "
    "vittoria è sua.<\f>{t3}{q}{C13}\"Oh, no! Hai sconfitto il mio "
    "Batranzer!\" {c}<\f>{u}{b}{B}Mentre {C14}Rey{c} riprende il suo Driger, "
    "la terra inizia a tremare e la caverna sembra sul punto di "
    "crollare...<\f>{A6}{Q}{C12}\"Ecco l'uscita!\"{c}<\f>{U}I tre fuggono "
    "appena in tempo mentre la caverna crolla alle loro spalle...",
};

static const unk8* _806A560[5] = {
    "{C14}Kai{c}, {C14}Kenny{c} and {C14}Hilary{c} are heading for the lighthouse. As they come "
    "to a bridge, they are surprised to see a BeyStadium...<\f>{t1}{f}{a17}{q}{C13}\"I have been "
    "waiting for you, {C14}Kai{c}!\" {c}<\f>{u}{A5}{Q}{C12}\"This bridge is the only way to the "
    "lighthouse and they knew {C14}Kai{c} would come this way.\" "
    "{c}<\f>{U}{t2}{A3}{Q}{C12}\"Chief's right, I'm next on their list. It's my turn to battle "
    "them!\"{c}<\f>{U}{q}{C13}\"Let's do this!{f4}\" {c}<\f>{u}{Q}{C12}\"Grrr!\"{c}",
    "{C14}Kai{c}, {C14}Kenny{c} y {C14}Hilary{c} se dirigen hacia el faro; al llegar a un "
    "puente, se sorprenden de encontrar un Estadio de Peonzas...<\f>{t1}{f}{a17}{q}{C13}\"Estaba "
    "esperándote, {C14}Kai{c}\" {c}<\f>{u}{A5}{Q}{C12}\"Este es el único camino hacia el faro, y "
    "sabían que {C14}Kai{c} tendría que cruzarlo\" {c}<\f>{U}{t2}{A3}{Q}{C12}\"El jefe tiene "
    "razón; estoy en su lista. Es el momento de que luche contra "
    "ellos\"{c}<\f>{U}{q}{C13}\"¡Hagámoslo!{f4}\" {c}<\f>{u}{Q}{C12}\"¡Grrr!\"{c}",
    "{C14}Kai{c}, {C14}Kenny{c} und {C14}Hilary{c} sind auf dem Weg zum Leuchtturm, als sie an "
    "einer Brücke überraschenderweise eine Bey-Arena vorfinden...<\f>{t1}{f}{a17}{q}{C13}\"Ich "
    "habe auf dich gewartet, {C14}Kai{c}!\" {c}<\f>{u}{A5}{Q}{C12}\"Diese Brücke ist der einzige "
    "Weg zum Leuchtturm. Sie wussten also, dass {C14}Kai{c} hier entlang kommen würde!\" "
    "{c}<\f>{U}{t2}{A3}{Q}{C12}\"Der Chef hat Recht. Ich bin der Nächste auf ihrer Liste. Ich "
    "werde kämpfen müssen.\"{c}<\f>{U}{q}{C13}\"Lass uns beginnen!{f4}\" "
    "{c}<\f>{u}{Q}{C12}\"Grrr!\"{c}",
    "{C14}Kai{c}, {C14}Kenny{c} et {C14}Hilary{c} se dirigent vers le phare. En arrivant près "
    "d'un pont, ils sont surpris de découvrir un stade...<\f>{t1}{f}{a17}{q}{C13}\"Je "
    "t'attendais, {C14}Kai{c}.\" {c}<\f>{u}{A5}{Q}{C12}\"Ce pont est le seul chemin menant au "
    "phare et ils savaient que {C14}Kai{c} passerait par ici.\" {c}<\f>{U}{t2}{A3}{Q}{C12}\"Le "
    "chef a raison, je suis le prochain sur leur liste. C'est à mon tour de les "
    "affronter.\"{c}<\f>{U}{q}{C13}\"Allons-y!{f4}\" {c}<\f>{u}{Q}{C12}\"Grrr!\"{c}",
    "Mentre si dirigono al faro, nei paraggi di un ponte {C14}Kay{c}, il {C14}Prof. Kappa{c} e "
    "{C14}Hilary{c} sono sorpresi di vedere uno stadio Beyblade...<\f>{t1}{f}{a17}{q}{C13}\"Ti "
    "stavo aspettando, {C14}Kay{c}.\" {c}<\f>{u}{A5}{Q}{C12}\"Questo ponte è l'unica via "
    "d'accesso al faro e sapevano che {C14}Kay{c} sarebbe passato di qui.\" "
    "{c}<\f>{U}{t2}{A3}{Q}{C12}\"Il capo ha ragione. Io sono il prossimo nel loro elenco, è il "
    "mio turno di battermi.\"{c}<\f>{U}{q}{C13}\"Avanti!{f4}\" {c}<\f>{u}{Q}{C12}\"Grrr!\"{c}",
};

static const unk8* _806A574[5] = {
    "During the battle, {C14}Kenny{c} realizes that {C14}Doctor B{c} must be running some sort "
    "of program to capture the Bit Beasts. <\f>{t3}As {C14}Kai{c}{A3} unleashes Dranzer's Flame "
    "Saber Attack as the final devastating blow against {C14}Figel{c}{a17}'s "
    "blade...<\f>{C14}Kenny{c}{A5} and {C14}Dizzi{c}{a15} manage to hack in to the island's "
    "computer system and cause it to crash, keeping {C14}Kai's{c} Bit Beast safe from capture.",
    "Durante la batalla, {C14}Kenny{c} se da cuenta de que el {C14}Doctor "
    "B{c} debe estar ejecutando algún tipo de programa para capturar a los "
    "Bit Beast,<\f>{t3}Mientras {C14}Kai{c}{A3} libera el ataque Lanzallamas "
    "de Dranzer como último y devastador golpe contra la peonza de "
    "{C14}Figel{c}{a17}<\f>{C14}Kenny{c}{A5} y {C14}Dizzi{c}{a15} consiguen "
    "piratear el sistema informático de la isla y hacen que se bloquee, "
    "logrando proteger a la Bit Beast de {C14}Kai{c} de la captura.",
    "Während des Kampfes wird {C14}Kenny{c} plötzlich klar, dass {C14}Doctor "
    "B{c} eine Art Programm ablaufen lässt, um die Bit Beasts zu fangen, "
    "<\f>{t3}{C14}Kai{c}{A3} entfesselt schließlich die Flame Saber-Attacke "
    "seines Dranzers, um dem Blade seines Gegners {C14}Figel{c}{a17} den Rest "
    "zu geben. <\f>{C14}Kenny{c}{A5} und {C14}Dizzi{c}{a15} gelingt es, in "
    "das Computersystem der Insel einzudringen und es auszuschalten, so dass "
    "{C14}Kais{c} Bit Beast nicht gefangen wird.",
    "Durant le combat, {C14}Kenny{c} réalise que le {C14}docteur B{c} doit "
    "être en train de faire fonctionner un programme pour capturer les Bit "
    "Beasts.<\f>{t3}Pendant que {C14}Kai{c}{A3} lance l'attaque Sabre de feu "
    "de Dranzer comme coup de grâce contre le Beyblade de {C14}Figel{c}{a17}, "
    "<\f>{C14}Kenny{c}{A5} et {C14}Dizzi{c}{a15} réussissent à pirater le "
    "réseau informatique de l'île et à le faire planter, évitant ainsi la "
    "capture du Bit Beast de {C14}Kai{c}.",
    "Durante la battaglia, il {C14}Prof. Kappa{c} capisce che il {C14}Dottor "
    "B{c} sta usando un programma di qualche tipo per catturare i Bit "
    "Beast.<\f>{t3}Mentre {C14}Kay{c}{A3} scatena l'attacco Energia di fuoco "
    "del Dranzer come colpo finale contro il Beyblade di "
    "{C14}Figel{c}{a17}...<\f>...il {C14}Prof. Kappa{c}{A5} e "
    "{C14}Dizzi{c}{a15} riescono a entrare nel sistema di computer dell'isola "
    "per bloccarlo, impedendo la cattura del Bit Beast di {C14}Kay{c}.",
};

static const unk8* _806A588[5] = {
    "{C14}Tyson{c}, {C14}Max{c} and {C14}Ray{c} have arrived at a waterfall and are not sure "
    "where to go next. <\f>{t1}{f}{a14}{q}{C13}\"Ha ha ha ha!\"{c}<\f>{u}{A9}{Q}{C12}\"Hey guys, "
    "up there!!\" {c}<\f>{U}Through the mist of the waterfall {C14}Daryl{c} walks "
    "forward.<\f>{t2}{q}{C13}\"Bring it!!\"{c}<\f>{u}{A10}{Q}{C12}\"Let it Rip{f4}!!\" {c}",
    "{C14}Tyson{c}, {C14}Max{c} y {C14}Ray{c} han llegado a la cascada y no están seguros de por "
    "dónde continuar<\f>{t1}{f}{a14}{q}{C13}\"JA, ja, ja, ja\"{c}<\f>{u}{A9}{Q}{C12}\"Eh, "
    "chicos,¡aquí arriba!\" {c}<\f>{U}A través de la neblina de la cascada, avanza "
    "{C14}Daryl{c}<\f>{t2}{q}{C13}\"¡¡Adelante!!\"{c}<\f> {u}{A10}{Q}{C12}\" ¡¡Lanza{f4}!!\" {c}",
    "{C14}Tyson{c}, {C14}Max{c} und {C14}Ray{c} haben einen Wasserfall "
    "erreicht und wissen nicht, wohin sie jetzt gehen sollen. "
    "<\f>{t1}{f}{a14}{q}{C13}\"Ha ha ha ha!\"{c}<\f>{u}{A9}{Q}{C12}\"Hey, "
    "Leute! Da oben!\" {c}<\f>{U}{C14}Daryl{c} schreitet durch den Sprühnebel "
    "des Wasserfalls. <\f>{t2}{q}{C13}\"Und los!\"{c}<\f> "
    "{u}{A10}{Q}{C12}\"Let it rip{f4}!\" {c}",
    "{C14}Tyson{c}, {C14}Max{c} et {C14}Ray{c} sont arrivés à une cascade et "
    "se demandent où aller ensuite. <\f>{t1}{f}{a14}{q}{C13}\"Ha ha ha "
    "ha!\"{c}<\f>{u}{A9}{Q}{C12}\"Eh, là-haut, les mecs!\" {c}<\f>{U}A "
    "travers les embruns de la cascade, {C14}Daryl{c} "
    "s'avance.<\f>{t2}{q}{C13}\"Allez, viens!\"{c}<\f> "
    "{u}{A10}{Q}{C12}\"Hyper vitesse {f4}!\" {c}",
    "{C14}Takao{c}, {C14}Max{c} e {C14}Rey{c} sono arrivati a una cascata e "
    "non sanno come procedere.<\f>{t1}{f}{a14}{q}{C13}\"Ah ah ah "
    "ah!\"{c}<\f>{u}{A9}{Q}{C12}\"Ehi, ragazzi, lassù!\" "
    "{c}<\f>{U}{C14}Daryl{c} attraversa gli spruzzi della "
    "cascata.<\f>{t2}{q}{C13}\"Fatevi sotto!\"{c}<\f> {u}{A10}{Q}{C12}\"3, 2, "
    "1, pronti... lancio{f4}!\" {c}",
};

static const unk8* _806A59C[5] = {
    "{C14}Tyson{c} uses Dragoon to take down {C14}Daryl's{c} Darylanzer.<\f>As {C14}Tyson{c} "
    "releases his Bit Beast {C14}Doctor B{c}{a16} is waiting with his Bit Beast capture program "
    "running again. <\f>{q}{C13}\"After all my research, today is the day Dragoon will be "
    "mine!\"{c}<\f>{u}{b}{B}{t3}The unbelievable power of {C14}Tyson's{c} Dragoon causes some "
    "sort of massive feedback loop within the island's computer system. "
    "<\f>{A23}{a24}{Q}{C13}{q}\"Let's get out of here! Doctor, run quickly! This place is gonna "
    "blow!!\" {c}<\f>{U}{u}{b}{A5}{Q}{C12}\"Hey guys, look!\" {c}<\f>{U}A helicopter is flying "
    "over the island. From within, {C14}Mr. Dickenson{c}{a25} is looking for the missing "
    "Bladebreakers.<\f>{q}{C12}\"Set her down right here!\" {c}<\f>{u}{b}{B}At last, the "
    "Bladebreakers and {C14}Hilary{c} have been rescued from the island.",
    "{C14}Tyson{c} usa a Dragón para derribar el Darylanzer de {C14}Daryl{c}, mientras "
    "{C14}Tyson{c} libera su Bit Beast <\f>El {C14}Doctor B{c}{a16} está a la espera, con su "
    "programa de captura de Bit Beast de nuevo en funcionamiento<\f>{q}{C13}\"Después de todas "
    "mis investigaciones, hoy es el día en el que Dragón será mío\"{c}<\f>{u}{b}{B}{t3}El "
    "increíble poder del Dragón de {C14}Tyson{c} produce algún tipo de bucle de realimentación "
    "masivo en el sistema informático de la isla<\f>{A23}{a24}{Q}{C13}{q}\"¡Salgamos de aquí! "
    "Doctor, corra; ¡¡este lugar va a explotar!!\" {c}<\f>{U}{u}{b}{A5}{Q}{C12}\"¡Eh, chicos, "
    "mirad!\" {c}<\f>{U}Un helicóptero sobrevuela la isla; desde su interior, el {C14}Sr. "
    "Dickenson{c}{a25} está buscando a los Bladebreakers que faltan, <\f>{q}{C12}\"¡Baja aquí "
    "mismo!\" {c}<\f>{u}{b}{B}Finalmente, los Bladebreakers y {C14}Hilary{c} son rescatados de "
    "la isla.",
    "{C14}Tyson{c} kämpft mit Dragoon gegen {C14}Daryls{c} Darylanzer, doch als {C14}Tyson{c} "
    "sein Bit Beast einsetzt,<\f>lässt {C14}Doctor B{c}{a16} wieder sein Bit Beast-Fang-Programm "
    "laufen. <\f>{q}{C13}\"Nach all den Jahren der Forschung... wird Dragoon heute endlich mir "
    "gehören!\"{c}<\f>{u}{b}{B}{t3}Die unglaubliche Kraft von {C14}Tysons{c} Dragoon verursacht "
    "schwerwiegende Störungen im Computersystem der Insel. <\f>{A23}{a24}{Q}{C13}{q}\"Schnell "
    "raus hier! Doctor, laufen Sie weg, hier fliegt gleich alles in die Luft!\" "
    "{c}<\f>{U}{u}{b}{A5}{Q}{C12}\"Hey, Leute! Schaut mal!\" {c}<\f>{U}Aus einem Helikopter über "
    "der Insel hält {C14}Mr. Dickenson{c}{a25} Ausschau nach den vermissten Bladebreakers. "
    "<\f>{q}{C12}\"Wir gehen hier runter!\" {c}<\f>{u}{b}{B}Schließlich werden die Bladebreakers "
    "und {C14}Hilary{c} von der Insel gerettet.",
    "{C14}Tyson{c} utilise Dragoon pour éliminer le Darylanzer de {C14}Daryl{c}. Lorsque "
    "{C14}Tyson{c} libère son Bit Beast, <\f>le {C14}docteur B{c}{a16} attend, son programme de "
    "capture réactivé.<\f>{q}{C13}\"Après toutes mes recherches, Dragoon va enfin être à moi "
    "aujourd'hui!\"{c}<\f>{u}{b}{B}{t3}La puissance incroyable du Dragoon de {C14}Tyson{c} "
    "entraîne la mise en boucle du réseau informatique de l'île. "
    "<\f>{A23}{a24}{Q}{C13}{q}\"Filons d'ici! Docteur, il faut partir, cet endroit va "
    "exploser!\" {c}<\f>{U}{u}{b}{A5}{Q}{C12}\"Eh, les mecs, regardez!\" {c}<\f>{U}Un "
    "hélicoptère survole l'île; à l'intérieur, {C14}M. Dickenson{c}{a25} recherche les "
    "Bladebreakers disparus. <\f>{q}{C12}\"Il faut se poser ici!\" {c}<\f>{u}{b}{B}Les "
    "Bladebreakers et {C14}Hilary{c} sont enfin évacués de l'ile.",
    "{C14}Takao{c} usa il suo Dragoon per neutralizzare il Darylanzer di {C14}Daryl{c}. Mentre "
    "{C14}Takao{c} fa entrare in azione il suo Bit Beast...<\f>il {C14}Dottor B{c}{a16} fa "
    "partire nuovamente il suo programma di cattura.<\f>{q}{C13}\"Dopo tutte le mie ricerche, "
    "oggi finalmente il Dragoon diventerà mio.\"{c}<\f>{u}{b}{B}{t3}Ma l'incredibile potenza del "
    "Dragoon di {C14}Takao{c} scatena il caos nel sistema di computer "
    "dell'isola.<\f>{A23}{a24}{Q}{C13}{q}\"Usciamo di qui! Dottore, presto, se ne vada! Sta per "
    "saltare tutto!\" {c}<\f>{U}{u}{b}{A5}{Q}{C12}\"Ehi, ragazzi, guardate!\" {c}<\f>{U}Sopra "
    "l'isola si libra un elicottero, da cui {C14}Mr. Dickenson{c}{a25} sta cercando i "
    "Bladebreakers scomparsi.<\f>{q}{C12}\"Atterriamo laggiù!\" {c}<\f>{u}{b}{B}Finalmente, i "
    "Bladebreakers e {C14}Hilary{c} vengono portati via dall'isola.",
};

static const unk8* _806A5B0[5] = {
    "{A16}{Q}{C13}\"{C14}Gideon{c}!{a19}\" {c}<\f>{U}{t1}{q}{C13}\"Your plan was a complete "
    "failure. You couldn't get all four Bit Beasts. Isn't that right, Doctor?\" "
    "{c}<\f>{u}{Q}{C13}\"Yes, but I promise we will not fail you again!\" "
    "{c}<\f>{U}{A23}{Q}{C13}\"But how are we supposed to capture these Bit Beasts?\" "
    "{c}<\f>{U}{q}{C13}\"To capture a Bit Beast, you need a Bit Beast. We have a lot of data "
    "from our previous plan.<\f>If we utilize that information properly, in no time we can have "
    "in our possession our very own Bit Beast.\" {c}<\f>{u}{Q}{C13}\"Create a Bit Beast?\" "
    "{c}<\f>{U}{q}{C13}\"I'll leave this project in your hands, "
    "Doctor.\"{c}<\f>{u}{B}{b}Meanwhile, {C14}Ozuma{c} and {C14}Dunga{c} have met their team "
    "mates, {C14}Mariam{c} and {C14}Joseph{c}, who collectively are known as the Saint Shields. "
    "Some time later, {C14}Joseph{c} challenges {C14}Kai{c} to a fight, but it is cut short by "
    "the {C14}Men in Black{c} as they gather data for their new Cyber Bit Beasts.",
    "{A16}{Q}{C13}\"¡{C14}Gideon{c}!{a19}\" {c}<\f>{U}{t1}{q}{C13}\"Tu plan ha sido un completo "
    "fracaso. No pudiste conseguir los cuatro Bit Beast, ¿verdad, Doctor?\" "
    "{c}<\f>{u}{Q}{C13}\"Sí, ¡pero prometo que no volveré a fallarte!\" "
    "{c}<\f>{U}{A23}{Q}{C13}\"¿Y cómo se supone que vamos a capturar a esos Bit Beasts?\" "
    "{c}<\f>{U}{q}{C13}\"Para capturar un Bit Beast necesitas un Bit Beast. Tenemos un montón de "
    "datos de nuestro plan anterior. Si utilizamos adecuadamente esa información, pronto "
    "podremos tener en nuestras manos a nuestro propio Bit Beast\" {c}<\f> {u}{Q}{C13}\"¿Crear "
    "un Bit Beast?\" {c}<\f>{U}{q}{C13}\"Dejaré este proyecto en sus manos, "
    "Doctor\"{c}<\f>{u}{B}{b}Mientras tanto, {C14}Ozuma{c} y {C14}Dunga{c} se han encontrado con "
    "sus compañeros de equipo {C14}Mariam{c} y {C14}Joseph{c}, conocidos como los Saint Shields. "
    "Un poco más tarde, {C14}Joseph{c} reta a {C14}Kai{c} a una pelea, pero se ven interrumpidos "
    "por los {C14}Hombres de Negro{c}, que recogen datos para sus nuevas Ciber Bit Beasts.",
    "{A16}{Q}{C13}\"{C14}Gideon{c}!{a19}\" {c}<\f>{U}{t1}{q}{C13}\"Dieser Plan war ein totaler "
    "Reinfall. Sie konnten die vier Bit Beasts nicht fangen. Nicht wahr, Doctor?\" "
    "{c}<\f>{u}{Q}{C13}\"Ja, aber ich verspreche, dass wir nicht noch einmal versagen werden!\" "
    "{c}<\f>{U}{A23}{Q}{C13}\"Aber wie sollen wir diese Bit Beasts an uns bringen?\" "
    "{c}<\f>{U}{q}{C13}\"Um ein Bit Beast zu bekommen, braucht man ein anderes Bit Beast. Wir "
    "haben von der letzten Aktion noch jede Menge Daten. Wenn wir diese Daten nutzen, haben wir "
    "in kürzester Zeit unser eigenes Bit Beast.\" {c}<\f> {u}{Q}{C13}\"Sie wollen ein Bit Beast "
    "erschaffen?!\" {c}<\f>{U}{q}{C13}\"Ich lege dieses Projekt in Ihre Hände, "
    "Doctor!\"{c}<\f>{u}{B}{b}Mittlerweile haben {C14}Ozuma{c} und {C14}Dunga{c} sich mit ihren "
    "Teamkollegen {C14}Mariam{c} und {C14}Joseph{c} getroffen. Zusammen sind sie als die Saint "
    "Shields bekannt. Einige Zeit später fordert {C14}Joseph{c} {C14}Kai{c} zu einem Kampf auf. "
    "Aber sie werden durch die {C14}schwarz gekleideten Männer{c} gestört, die Daten für die "
    "neuen Cyber-Bit Beasts sammeln.",
    "{A16}{Q}{C13}\"{C14}Gideon{c}!{a19}\" {c}<\f>{U}{t1}{q}{C13}\"Votre plan a été un fiasco. "
    "Vous n'avez pas récupéré les quatre Bit Beasts, n'est-ce pas, docteur?\" "
    "{c}<\f>{u}{Q}{C13}\"C'est vrai, mais je vous promets que je ne vous décevrai plus!\" "
    "{c}<\f>{U}{A23}{Q}{C13}\"Mais comment allons-nous faire pour capturer ces Bit Beasts?\" "
    "{c}<\f>{U}{q}{C13}\"Pour capturer un Bit Beast, il faut un Bit Beast. Notre plan précédent "
    "nous a fourni des tonnes de données. Si nous exploitons correctement ces informations, nous "
    "aurons en un rien de temps notre propre Bit Beast.\" {c}<\f> {u}{Q}{C13}\"Créer un Bit "
    "Beast?\" {c}<\f>{U}{q}{C13}\"Je vous laisse la charge de ce projet, "
    "docteur.\"{c}<\f>{u}{B}{b}Pendant ce temps, {C14}Ozuma{c} et {C14}Dunga{c} ont retrouvé "
    "leurs équipiers {C14}Mariam{c} et {C14}Joseph{c}, dont l'équipe s'appelle les Saint "
    "Shields. Un peu plus tard, {C14}Joseph{c} lance un défi à {C14}Kai{c} mais est interrompu "
    "par les {C14}hommes en noir{c} qui recueillent des données pour leurs nouveaux Cyber Bit "
    "Beasts.",
    "{A16}{Q}{C13}\"{C14}Gideon{c}!{a19}\" {c}<\f>{U}{t1}{q}{C13}\"Il tuo piano è stato un "
    "fallimento completo. Non sei riuscito a catturare tutti i quattro Bit Beast, vero, "
    "dottore?\" {c}<\f>{u}{Q}{C13}\"È vero, ma prometto di non deluderti più!\" "
    "{c}<\f>{U}{A23}{Q}{C13}\"Ma come potremo catturare quei Bit Beast?\" "
    "{c}<\f>{U}{q}{C13}\"Per catturare un Bit Beast ci vuole un altro Bit Beast. Grazie al "
    "nostro piano precedente abbiamo raccolto molti dati. Usandoli correttamente, ben presto "
    "avremo il nostro Bit Beast personale.\" {c}<\f> {u}{Q}{C13}\"Cioè, creare un Bit Beast?\" "
    "{c}<\f>{U}{q}{C13}\"Lascio a te questo progetto, dottore.\"{c}<\f>{u}{B}{b}Intanto, "
    "{C14}Ozuma{c} e {C14}Dunga{c} hanno incontrato i loro compagni di squadra, {C14}Mao{c} e "
    "{C14}Joseph{c}. Tutti insieme sono noti come Saint Seals. Qualche tempo dopo, "
    "{C14}Joseph{c} sfida {C14}Kay{c}, ma gli {C14}uomini in nero{c} gli concedono poco tempo "
    "perché devono raccogliere i dati per il nuovo Cyber Bit Beast.",
};

static const unk8* _806A5C4[5] = {
    "In an attempt to get a clearer understanding of who the Saint Shields are up against in the "
    "battle against the Bladebreakers, <\f>{C14}Joseph{c} spies on {C14}Doctor B{c} and learns "
    "of the plan to create a... <\f>{a2}{q}{C13}\"Cyber Bit Beast??"
    "!!\"{c}<\f>{u}{b}Later, when telling the Saint Shields about his discovery, they decide "
    "upon a plan.<\f>{a1}{q}{C13}\"We gotta stop those Cyber Bit Beasts before they become a "
    "cyber pain in the neck!\"{c}<\f>{u}{b}{C14}Mariam{c} and {C14}Joseph{c} set out to test "
    "{C14}Max{c} and {C14}Ray's{c} skill in an unscheduled match. {C14}Max{c} and {C14}Ray's{c} "
    "lack of teamwork leads to a humiliating defeat. <\f>{A9}{Q}{C12}\"Awwwww, man...\" "
    "{c}<\f>{U}{a1}{q}{C13}\"Ha! Way to choke there, boys\" {c}",
    "En un intento de aclarar contra quiénes están los Saint Shield en esta batalla contra los "
    "Bladebreakers,<\f>{C14}Joseph{c} espía al {C14}Doctor B{c} y se entera del plan para crear "
    "un... <\f>{a2}{q}{C13}\"¡¿Ciber Bit Beast?!\"{c}<\f>{u}{b}Más tarde, mientras cuenta a los "
    "Saint Shields su descubrimiento, deciden trazar un plan<\f>{a1}{q}{C13}\"Debemos detener a "
    "esos Cíber Bit Beast ¡antes de que se transformen en un cíber dolor en el "
    "trasero!\"{c}<\f>{u}{b}{C14}Mariam{c} y {C14}Joseph{c} se preparan para poner las "
    "habilidades de {C14}Max{c} y de {C14}Ray{c} a prueba en un encuentro no planificado. La "
    "falta de cooperación entre {C14}Max{c} y {C14}Ray{c} les lleva a una derrota humillante. "
    "<\f>{A9}{Q}{C12}\"Ooooooh, tío...\" {c}<\f>{U}{a1}{q}{C13}\"¡Ja!.. Aún os queda mucho "
    "camino, chicos\" {c}",
    "Um mehr darüber zu erfahren, was die Saint Shields im Falle eines Kampfes gegen die "
    "Bladebreakers erwartet, <\f>spioniert {C14}Joseph{c} {C14}Doctor B{c} aus. Er erfährt von "
    "dem Projekt zur Erschaffung eines... <\f>{a2}{q}{C13}\"Cyber-Bit Beast?!\"{c}<\f>{u}{b}Als "
    "er den Saint Shields später von seiner Entdeckung berichtet, fassen sie einen Plan. "
    "<\f>{a1}{q}{C13}\"Wir müssen diese Cyber-Bit Beasts stoppen, bevor es zu spät "
    "ist!\"{c}<\f>{u}{b}{C14}Mariam{c} und {C14}Joseph{c} machen sich auf, um {C14}Max{c} und "
    "{C14}Ray{c} auf ein spontanes Match herauszufordern. {C14}Max{c} und {C14}Ray{c} erleiden "
    "wegen ihrer mangelnden Teamarbeit eine demütigende Niederlage. <\f>{A9}{Q}{C12}\"Ooooh, "
    "Mann...\" {c}<\f>{U}{a1}{q}{C13}\"Ha! Geschieht euch recht, Jungs. \" {c}",
    "Pour tenter de mieux comprendre à qui les Saint Shields ont affaire dans leur combat contre "
    "les Bladebreakers, <\f>{C14}Joseph{c} espionne le {C14}docteur B{c} et découvre le plan "
    "visant à créer un... <\f>{a2}{q}{C13}\"Cyber Bit Beast??"
    "!!\"{c}<\f>{u}{b}Plus tard, lorsqu'il expose sa découverte aux Saint Shields, ceux-ci "
    "décident d'un plan. <\f>{a1}{q}{C13}\"Nous devons arrêter ces Cyber Bit Beasts avant qu'ils "
    "ne deviennent cyber genants!\"{c}<\f>{u}{b}{C14}Mariam{c} et {C14}Joseph{c} décident "
    "d'aller mettre à l'épreuve les talents de {C14}Max{c} et {C14}Ray{c} lors d'un match "
    "impromptu. Le manque de travail d'équipe de {C14}Max{c} et {C14}Ray{c} entraîne une défaite "
    "humiliante. <\f>{A9}{Q}{C12}\"Oooohhh, non...\" {c}<\f>{U}{a1}{q}{C13}\"Ha! Dans les dents, "
    "les mecs!\" {c}",
    "Per capire meglio chi dovranno affrontare i Saint Seals nella loro sfida contro i "
    "Bladebreakers...<\f>...{C14}Joseph{c} spia il {C14}Dottor B{c} e scopre il piano di creare "
    "un...<\f>{a2}{q}{C13}\"...Cyber Bit Beast?!\"{c}<\f>{u}{b}Più tardi, dopo aver rivelato ai "
    "Saint Seals la sua scoperta, viene deciso un piano.<\f>{a1}{q}{C13}\"Dobbiamo fermare quel "
    "Cyber Bit Beast prima che diventi una minaccia!\"{c}<\f>{u}{b}{C14}Mao{c} e {C14}Joseph{c} "
    "si preparano a valutare l'abilità di {C14}Max{c} e {C14}Rey{c} in un incontro improvvisato. "
    "{C14}Max{c} e {C14}Rey{c} subiscono un'umiliante sconfitta a causa del loro pessimo lavoro "
    "di squadra.<\f>{A9}{Q}{C12}\"Oh, nooooo...!\" {c}<\f>{U}{a1}{q}{C13}\"Ha! Ingoiate questo "
    "rospo, ragazzi!\" {c}",
};

static const unk8* _806A5D8[5] = {
    "{C14}Tyson{c} arrives just as {C14}Max{c} and {C14}Ray's{c} battle "
    "against {C14}Joseph{c} and {C14}Mariam{c} comes to an end.<\f>At the "
    "same time {t1}{C14}Ozuma{c}{a8} steps out of the shadows... The second "
    "that {C14}Tyson{c}{A10} sees him... <\f>{t2}{Q}{C12}\"So how about it, "
    "{C14}Ozuma{c}, or are you too chicken!?\" {c}<\f>{U}{q}{C13}\"Bring it "
    "on{f4}!\"{c}",
    "{C14}Tyson{c} llega justo cuando la batalla de {C14}Max{c} y {C14}Ray{c} "
    "contra {C14}Joseph{c} y {C14}Mariam{c} termina; <\f>Al mismo tiempo, "
    "{t1}{C14}Ozuma{c}{a8} sale de entre las sombras... En el mismo instante "
    "en que {C14}Tyson{c}{A10} le ve<\f>{t2}{Q}{C12}\"¡¿Te animas, "
    "{C14}Ozuma{c}, o eres un gallina?!\" {c}<\f>{U}{q}{C13}\"¡Prepárate para "
    "lanzar{f4}!\"{c}",
    "{C14}Tyson{c} kommt gerade an, als der Kampf von {C14}Max{c} und "
    "{C14}Ray{c} gegen {C14}Joseph{c} und {C14}Mariam{c} zu Ende geht, "
    "während gleichzeitig <\f>{t1}{C14}Ozuma{c}{a8} aus dem Schatten tritt... "
    "Es ist das zweite Mal, dass {C14}Tyson{c}{A10} ihn sieht. "
    "<\f>{t2}{Q}{C12}\"Wie wär's mit einem Kampf, {C14}Ozuma{c}, oder hast du "
    "zu viel Angst!?\" {c}<\f>{U}{q}{C13}\"Na los, zeig's mir{f4}!\"{c}",
    "{C14}Tyson{c} arrive au moment où le match opposant {C14}Joseph{c} et "
    "{C14}Ray{c} à {C14}Joseph{c} et {C14}Mariam{c} touche à sa fin. Au même "
    "instant, <\f>{t1}{C14}Ozuma{c}{a8} sort de l'ombre... A la seconde où "
    "{C14}Tyson{c}{A10} l'aperçoit:<\f>{t2}{Q}{C12}\"Qu'est-ce que tu en dis, "
    "{C14}Ozuma{c}? Ou alors tu as la trouille?\" {c}<\f>{U}{q}{C13}\"Je "
    "t'attends{f4}!\"{c}",
    "{C14}Takao{c} arriva proprio quando la battaglia di {C14}Max{c} e "
    "{C14}Rey{c} contro {C14}Joseph{c} e {C14}Mao{c} sta per finire. In quel "
    "momento...<\f>{t1}{C14}Ozuma{c} esce dall'ombra. Non appena "
    "{C14}Takao{c}{A10} lo vede...<\f>{t2}{Q}{C12}\"Che ne dici, "
    "{C14}Ozuma{c}, ci battiamo? O sei troppo codardo?\" "
    "{c}<\f>{U}{q}{C13}\"Fatti sotto{f4}!\"{c}",
};

static const unk8* _806A5EC[5] = {
    "After a desperate battle, {C14}Tyson{c}{A10} manages to defeat "
    "{C14}Ozuma{c}{a8}. <\f>{t3}{Q}{C12}\"Alright, I did it!\" "
    "{c}<\f>{U}{C14}Ozuma{c} seems amused...<\f>{q}{C13}\"You just showed me "
    "your strengths in battle! Maybe one day you'll get it, "
    "{C14}Tyson{c}.\"{c}",
    "Tras una batalla desesperada, {C14}Tyson{c}{A10} consigue derrotar a "
    "{C14}Ozuma{c}{a8} <\f>{t3}{Q}{C12}\"Muy bien, ¡lo conseguí!\" "
    "{c}<\f>{U}{C14}Ozuma{c} parece divertido...<\f>{q}{C13}\"Acabas de "
    "mostrarme tu fortaleza en la batalla! Quizá un día te encuentres con la "
    "horma de tu zapato, {C14}Tyson{c}.\" {c}",
    "Nach einem harten Kampf kann {C14}Tyson{c}{A10} {C14}Ozuma{c}{a8} besiegen. "
    "<\f>{t3}{Q}{C12}\"OK, ich habe gesiegt!\" {c}<\f>{U}{C14}Ozuma{c} scheint sich über etwas "
    "zu amüsieren...<\f>{q}{C13}\"Du hast mir eben deine Stärken im Kampf demonstriert! "
    "Vielleicht wirst du eines Tages mehr verstehen, {C14}Tyson{c}.\" {c}",
    "Après un combat acharné, {C14}Tyson{c}{A10} parvient à vaincre "
    "{C14}Ozuma{c}{a8}.<\f>{t3}{Q}{C12}\"Parfait, j'ai réussi!\" "
    "{c}<\f>{U}{C14}Ozuma{c} a l'air amusé...<\f>{q}{C13}\"Tu viens de me "
    "montrer tes points forts au combat! Tu comprendras peut-être un jour, "
    "{C14}Tyson{c}.\" {c}",
    "Dopo una battaglia disperata, {C14}Takao{c}{A10} riesce a sconfiggere "
    "{C14}Ozuma{c}{a8}.<\f>{t3}{Q}{C12}\"Evviva, ce l'ho fatta!\" "
    "{c}<\f>{U}{C14}Ozuma{c} sembra divertito.<\f>{q}{C13}\"Mi hai appena "
    "mostrato quali sono i tuoi punti di forza quando ti batti. Forse un "
    "giorno riceverai una lezione, {C14}Takao{c}.\" {c}",
};

static const unk8* _806A600[5] = {
    "{C14}Doctor B{c} enters {f}{C14}Gerry{c}{a18}, a member of Team Psykick, into a local "
    "tournament. {C14}Gerry's{c} blade has been fitted with one of the Cyber Bit Beasts. "
    "<\f>During the tournament, {C14}Gerry{c} is seemingly unstoppable. <\f>{q}{C13}\"Feel the "
    "power of the most impeccable creation in the entire universe!!\" "
    "{c}<\f>{u}{b}{C14}Gerry's{c} blade is emitting so much power that it eventually explodes "
    "and he has to escape in a nearby van...<\f>{C14}Kenny{c}, having witnessed this with the "
    "other Bladebreakers, is intrigued and hacks into {C14}Gideon's{c} computer.<\f>He learns of "
    "the Cyber Bit Beasts and how they are made from information copied from the Bladebreakers' "
    "own Bit Beasts.<\f>The Bladebreakers better get practicing if they are going to stand any "
    "chance at all of taking down Team Psykick!!",
    "El {C14}Doctor B{c} inscribe a {f}{C14}Gerry{c}{a18}, un miembro del equipo Psykick, en un "
    "torneo local; la peonza de {C14}Gerry{c} ha sido modificada con uno de los Ciber Bit "
    "Beasts. Durante el torneo, {C14}Gerry{c} parece imparable. <\f>{q}{C13}\"¡¡Sentid el poder "
    "de la creación más impecable del mundo entero!!\" {c}<\f>{u}{b}La peonza de {C14}Gerry{c} "
    "emite tanto poder que, finalmente, explota, y él tiene que huir en una furgoneta "
    "cercana...<\f>{C14}Kenny{c}, tras presenciar esto con los otros Bladebreakers, está "
    "intrigado, y piratea el ordenador de {C14}Gideon{c}; se entera de lo de los Ciber Bit "
    "Beasts y de cómo han sido creadas a partir de los propios Bit Beasts de los Bladebreakers. "
    "¡¡Será mejor que los Bladebreakers empiecen a practicar si quieren tener alguna oportunidad "
    "de derrotar al equipo Psykick!!",
    "{C14}Doctor B{c} schickt {f}{C14}Gerry{c}{a18}, ein Mitglied des Teams Psykick, in einen "
    "kleineren Wettbewerb. {C14}Gerrys{c} Blade wurde mit einem der Cyber-Bit Beasts "
    "ausgestattet. Im Laufe des Wettbewerbs erweist sich {C14}Gerry{c} als unaufhaltsam. "
    "<\f>{q}{C13}\"Seht die Macht der unfehlbarsten Kreation im gesamten Universum!\" "
    "{c}<\f>{u}{b}{C14}Gerrys{c} Blade strömt so viel Energie aus, dass es schließlich "
    "explodiert und Gerry mit einem in der Nähe geparkten Lieferwagen flüchten "
    "muss...<\f>{C14}Kenny{c} hat mit den anderen Bladebreakers die Geschehnisse aufmerksam "
    "beobachtet und loggt sich daraufhin in {C14}Gideons{c} Computer ein. So erfährt er von den "
    "Cyber-Bit Beasts und ihrer Erschaffung. Als Basis dienten die von den eigentlichen Bit "
    "Beasts der Bladebreakers kopierten Informationen. Die Bladebreakers müssen sich jetzt etwas "
    "einfallen lassen, wenn sie gegen das Team der Psykicks eine Chance haben wollen!",
    "Le {C14}docteur B{c} fait participer {f}{C14}Gerry{c}{a18}, un membre de l'équipe Psykick, "
    "à un tournoi local. Le Blade de {C14}Gerry{c} a été équipé d'un des Cyber Bit Beasts. Au "
    "cours du tournoi, {C14}Gerry{c} semble invincible. <\f>{q}{C13}\"Découvrez le pouvoir de la "
    "plus parfaite création de tout l'univers!\" {c}<\f>{u}{b}Le Beyblade de {C14}Gerry{c} "
    "dégage tant de puissance qu'il finit par exploser et que {C14}Gerry{c} doit prendre la "
    "fuite vers une camionnette toute proche...<\f>{C14}Kenny{c}, qui a vu cela avec les autres "
    "Bladebreakers, est intrigué et pirate l'ordinateur de {C14}Gideon{c}. Il y apprend "
    "l'existence des Cyber Bit Beasts conçus à partir des informations tirées des Bit Beasts des "
    "Bladebreakers. Les Bladebreakers feraient mieux de s'entraîner s'ils veulent avoir une "
    "chance de battre l'équipe Psykick!",
    "Il {C14}Dottor B{c} iscrive {f}{C14}Gerry{c}{a18}, un membro della squadra Psykicks, a un "
    "torneo locale. Il Beyblade di {C14}Gerry{c} è equipaggiato con uno dei nuovi Cyber Bit "
    "Beast. Per tutto il torneo, {C14}Gerry{c} sembra inarrestabile.<\f>{q}{C13}\"Assaggiate la "
    "potenza della più superba creazione dell'universo!\" {c}<\f>{u}{b}Ma il Beyblade di "
    "{C14}Gerry{c} genera così tanta energia che alla fine esplode, costringendolo alla fuga su "
    "un furgone che attendeva nei paraggi.<\f>Il {C14}Prof. Kappa{c}, che ha assistito con "
    "stupore alla scena con gli altri Bladebreakers, entra nel computer di {C14}Gideon{c} e "
    "scopre il Cyber Bit Beast e come è stato costruito sfruttando informazioni prelevate dai "
    "Bit Beast dei Bladebreakers. Sarà necessario molto allenamento per avere qualche "
    "probabilità di vincere contro la squadra Psykicks!",
};

static const unk8* _806A614[5] = {
    "In {C14}Doctor B{c}{a16}'s laboratory, the final tests are being carried out on the Cyber "
    "Bit Beasts.<\f>{q}{C13}\"Initiate Bit Beast trial run. Thanks to the information we've "
    "gathered, our Cyber Bit Beast has finally been perfected.\" {c}<\f>{u}{t1}{A19}{Q}{C13}\"I "
    "just hope this one doesn't run wild too.\" {c}<\f>{U}{q}{C13}\"All we need is a blader "
    "skillful enough to handle this technology, {C14}Gideon{c}.\"{c}<\f>{u}{Q}{C13}\"Do you have "
    "anyone in mind, Doctor?\" {c}<\f>{U}{q}{C13}\"Yes, you will be able to meet him soon, "
    "{C14}Gideon{c}.\" {c}{u}",
    "En el laboratorio del {C14}Doctor B{c}{a16} se están realizando las pruebas definitivas de "
    "los Ciber Bit Beasts.<\f>{q}{C13}\"Iniciar prueba de Bit Beast. Gracias a la información "
    "que hemos recogido, nuestros Cíber Bit Beasts han sido perfeccionados al fin.\" "
    "{c}<\f>{u}{t1}{A19}{Q}{C13}\"Solo espero que éste no se vuelva loco también\" "
    "{c}<\f>{U}{q}{C13}\"Todo lo que necesitamos es un Blader con la suficiente habilidad para "
    "manejar esta tecnología, {C14}Gideon{c}.\"{c}<\f>{u}{Q}{C13}\"Tiene a alguien en mente, "
    "Doctor?\" {c}<\f>{U}{q}{C13}\"Sí, pronto podrás conocerle, {C14}Gideon{c}\" {c}",
    "In {C14}Doctor B{c}{a16}'s Labor finden die letzten Tests mit den Cyber-Bit Beasts "
    "statt.<\f>{q}{C13}\"Bit Beast-Testlauf wird gestartet. Dank der gesammelten Informationen "
    "konnten wir unser Cyber-Bit Beast perfektionieren.\" {c}<\f>{u}{t1}{A19}{Q}{C13}\"Ich hoffe "
    "nur, dass es nicht wieder außer Kontrolle gerät.\" {c}<\f>{U}{q}{C13}\"Wir brauchen nur "
    "einen Blader, der mit dieser Technologie umgehen kann, "
    "{C14}Gideon{c}.\"{c}<\f>{u}{Q}{C13}\"Denken Sie an jemand bestimmtes, Doctor?\" "
    "{c}<\f>{U}{q}{C13}\"Ja, Sie werden ihn schon bald treffen, {C14}Gideon{c}.\" {c}",
    "Dans le labo du {C14}docteur B{c}{a16}, on effectue les derniers tests des Cyber Bit "
    "Beasts.<\f>{q}{C13}\"Lancez le programme de test. Grâce aux informations obtenues, nous "
    "avons enfin pu perfectionner notre Cyber Bit Beast.\" {c}<\f>{u}{t1}{A19}{Q}{C13}\"J'espère "
    "que celui-là ne va pas devenir fou, lui aussi.\" {c}<\f>{U}{q}{C13}\"Il nous faut "
    "simplement un blader assez doué pour maîtriser cette technologie, "
    "{C14}Gideon{c}.\"{c}<\f>{u}{Q}{C13}\"Vous pensez à quelqu'un en particulier, docteur?\" "
    "{c}<\f>{U}{q}{C13}\"Oui, vous le rencontrerez bientôt, {C14}Gideon{c}\" {c}",
    "Nel laboratorio del {C14}Dottor B{c}{a16}, sono in corso le ultime prove del Cyber Bit "
    "Beast.<\f>{q}{C13}\"Procediamo con il collaudo del Bit Beast. Grazie alle informazioni che "
    "abbiamo raccolto, il nostro Cyber Bit Beast è stato finalmente perfezionato.\" "
    "{c}<\f>{u}{t1}{A19}{Q}{C13}\"Spero solo che non impazzisca ancora.\" {c}<\f>{U}{q}{C13}\"Ci "
    "serve soltanto un Beyblader abbastanza abile da controllare questa tecnologia, "
    "{C14}Gideon{c}.\"{c}<\f>{u}{Q}{C13}\"Hai qualcuno in mente, Dottore?\" "
    "{c}<\f>{U}{q}{C13}\"Sì, {C14}Gideon{c}. Lo incontrerai presto.\" {c}",
};

static const unk8* _806A628[5] = {
    "{C14}Tyson's{c}{A10} {f}{C14}Grandpa{c}{a21} is fishing down by the river. A huge fish has "
    "bitten his line and he is struggling to reel it in.<\f>{q}{C12}\"Yo, push it up, y'all!!\" "
    "{c}<\f>{u}As he strains and tugs, he loses his balance and is pulled in to the stream! "
    "<\f>{Q}{C12}\"{C14}Grandpa{c}!! Hang in there!!\" {c}<\f>{U}Two strangers "
    "{f}{A4}{f}{a22}are nearby. They come rushing to help.<\f>{Q}{q}{C12}\"Wait up!! We'll help "
    "ya!!\" {c}<\f>{u}{U}Together, they all leap into action and manage to pull {C14}Grandpa{c} "
    "to safety. <\f>{A5}{Q}{C12}\"Thanks, you guys, for saving his "
    "life!!\"{c}<\f>{U}{q}{C12}\"Just happy to help.\" {c}<\f>{u}{A9}{Q}{C12}\"Who are you "
    "guys?\" {c}<\f>{U}{q}{C12}\"We're Bladers!\" {c}<\f>{u}{A5}{Q}{C12}\"Wow! So are we!\" "
    "{c}<\f>{U}{t2}{A10}{Q}{C12}\"Hey {C14}Kane{c}! How about a battle?\" "
    "{c}<\f>{U}{a4}{q}{C12}\"Sure!\" {c}<\f>{u}{Q}{q}{C12}\"Let it "
    "Rip{f4}!!\"{c}<\f>{U}{u}{C14}Tyson{c} and {C14}Kane{c} have an awesome battle. Their skills "
    "seem to be matched perfectly, so perfectly, in fact, that the battle ends in a "
    "tie!<\f>After the battle, as they go their separate ways, they all realize that they have "
    "made some great new friends today.",
    "{C14}El abuelo{c}{A10}{f}{C14} de Tyson{c}{a21} está pescando en el río. Un enorme pez ha "
    "mordido el anzuelo y el abuelo se esfuerza para pescarlo.<\f>{q}{C12}\"Venga, ¡¡levanta!!\" "
    "{c}<\f>{u}Al tirar con fuerza, pierde el equilibrio ¡y cae a la "
    "corriente!<\f>{Q}{C12}\"¡¡{C14}Abuelo{c}!! ¡¡aguanta un poco!!\" {c}<\f>{U}Dos "
    "extraños{f}{A4}{f}{a22} que andaban por ahí se apresuran a "
    "ayudar.<\f>{Q}{q}{C12}\"¡¡Espera!! ¡¡Te ayudaremos!!\" {c}<\f>{U}{u}Juntos, se ponen manos "
    "a la obra y consiguen poner al {C14}abuelo{c} a salvo. <\f>{A5}{Q}{C12}\"¡Tíos, gracias por "
    "salvarle la vida!\"{c}<\f>{U}{q}{C12}\"Estamos encantados de ayudar\" "
    "{c}<\f>{u}{A9}{Q}{C12}\"¿Quiénes sois?\" {c}<\f>{U}{q}{C12}\"¡Somos Bladers!\" "
    "{c}<\f>{u}{A5}{Q}{C12}\"¡Vaya, nosotros también!\" {c}<\f>{U}{t2}{A10}{Q}{C12}\"¡Oye, "
    "{C14}Kane{c}! ¿Hace una batalla?\" {c}<\f> {U}{a4}{q}{C12}\"Claro\" "
    "{c}<\f>{u}{Q}{q}{C12}\"¡¡Lanza{f4}!!\"{c}<\f>{U}{u}{C14}Tyson{c} y {C14}Kane{c} tienen una "
    "tremenda batalla y sus habilidades parecen exactamente parejas; tanto que, de hecho, ¡la "
    "batalla termina en un empate! Después de la batalla, mientras cada uno se marcha por su "
    "camino, todos se dan cuenta de que hoy han hecho unos nuevos amigos.",
    "{C14}Tysons{c}{A10} {f}{C14}Großvater{c}{a21} ist unten am Fluss beim Angeln. Ein großer "
    "Fisch hat gerade angebissen, und er bemüht sich, ihn aus dem Wasser zu "
    "ziehen.<\f>{q}{C12}\"Na los, komm schon raus!\" {c}<\f>{u}Als er mit all seiner Kraft an "
    "der Leine zieht, verliert er das Gleichgewicht und stürzt in den Fluss! "
    "<\f>{Q}{C12}\"{C14}Großvater{c}! Halt durch!\" {c}<\f>{U}Zwei Fremde {f}{A4}{f}{a22}, die "
    "zufällig in der Nähe sind, eilen herbei, um zu helfen. <\f>{Q}{q}{C12}\"Wartet! Wir helfen "
    "euch!\" {c}<\f>{U}{u}Zusammen gelingt es ihnen, {C14}Großvater{c} aus dem Wasser zu ziehen. "
    "<\f>{A5}{Q}{C12}\"Danke, dass ihr sein Leben gerettet habt!\"{c}<\f>{U}{q}{C12}\"Wir haben "
    "gern geholfen.\" {c}<\f>{u}{A9}{Q}{C12}\"Wer seid ihr Jungs?\" {c}<\f>{U}{q}{C12}\"Wir sind "
    "Blader!\" {c}<\f>{u}{A5}{Q}{C12}\"Wow! Wir auch!\" {c}<\f>{U}{t2}{A10}{Q}{C12}\"Hey, "
    "{C14}Kane{c}! Wie wär's mit einem Kampf?\" {c}<\f> {U}{a4}{q}{C12}\"Klar doch.\" "
    "{c}<\f>{u}{Q}{q}{C12}\"Let it rip{f4}!\"{c}<\f>{U}{u}{C14}Tyson{c} und {C14}Kane{c} legen "
    "einen faszinierenden Kampf hin, und in ihrem Kampftalent sind die beiden sich so "
    "ebenbürtig, dass der Kampf unentschieden endet. Als sie nach dem Kampf auseinander gehen, "
    "wird allen klar, dass sie heute großartige neue Freunde kennen gelernt haben.",
    "Le {f}{C14}grand-père{c}{a21} de {C14}Tyson{c}{A10} pêche le long de la rivière. Un énorme "
    "poisson a mordu et il essaie de le sortir de l'eau.<\f>{q}{C12}\"Allez, du nerf!\" "
    "{c}<\f>{u}Alors qu'il y met toute sa force, il perd l'équilibre et est entraîné dans l'eau! "
    "<\f>{Q}{C12}\"{C14}Grand-père{c}! Accroche-toi!\" {c}<\f>{U}Deux étrangers "
    "{f}{A4}{f}{a22}sont à proximité. Ils s'approchent en courant pour "
    "l'aider:<\f>{Q}{q}{C12}\"Attendez! On va vous aider!\" {c}<\f>{U}{u}Tous ensemble, ils se "
    "lancent à l'action et parviennent à mettre le {C14}grand-père{c} en sécurité. "
    "<\f>{A5}{Q}{C12}\"Merci de lui avoir sauvé la vie!\"{c}<\f>{U}{q}{C12}\"Ce n'est rien.\" "
    "{c}<\f>{u}{A9}{Q}{C12}\"Mais qui etes vous?\" {c}<\f>{U}{q}{C12}\"Nous sommes des "
    "bladers!\" {c}<\f>{u}{A5}{Q}{C12}\"Ca alors! Nous aussi!\" {c}<\f>{U}{t2}{A10}{Q}{C12}\"Eh, "
    "{C14}Kane{c}, cela te dirait, un combat?\" {c}<\f> {U}{a4}{q}{C12}\"Bien sûr.\" "
    "{c}<\f>{u}{Q}{q}{C12}\"Hyper vitesse {f4}!\"{c}<\f>{U}{u}{C14}Tyson{c} et {C14}Kane{c} "
    "s'affrontent dans un combat incroyable. Ils ont l'air d'être du même niveau, tellement "
    "proches que le combat s'achève par un match nul! Après le combat, alors qu'ils repartent "
    "chacun de leur côté, tous se rendent compte qu'ils ont rencontré de vrais amis aujourd'hui.",
    "{f}{C14}Nonno Jei{c}{a21} sta pescando nel fiume. Ha appena abboccato un grosso pesce e sta "
    "lottando per portarlo a riva.<\f>{q}{C12}\"Ehi, aiutatemi tutti!\" {c}<\f>{u}Mentre lotta "
    "con la sua preda, perde l'equilibrio e viene risucchiato nella "
    "corrente.<\f>{Q}{C12}\"{C14}Nonno{c}! Resisti!\" {c}<\f>{U}Due stranieri {f}{A4}{f}{a22}che "
    "si trovavano nei paraggi accorrono per prestare aiuto.<\f>{Q}{q}{C12}\"Resista! La "
    "aiuteremo noi!\" {c}<\f>{U}{u}Lavorando tutti insieme, riescono a riportare {C14}Nonno "
    "Jei{c} in salvo.<\f>{A5}{Q}{C12}\"Grazie per avergli salvato la "
    "vita!\"{c}<\f>{U}{q}{C12}\"È sempre un piacere essere d'aiuto.\" {c}<\f>{u}{A9}{Q}{C12}\"Ma "
    "voi chi siete?\" {c}<\f>{U}{q}{C12}\"Siamo Beyblader!\" {c}<\f>{u}{A5}{Q}{C12}\"Wow! Anche "
    "noi!\" {c}<\f>{U}{t2}{A10}{Q}{C12}\"Ehi, {C14}Kane{c}! Che ne dici di una sfida?\" {c}<\f> "
    "{U}{a4}{q}{C12}\"Ma certo.\" {c}<\f>{u}{Q}{q}{C12}\"3, 2, 1, pronti... "
    "lancio{f4}!\"{c}<\f>{U}{u}{C14}Takao{c} e {C14}Kane{c} si battono in modo incredibile. Le "
    "loro abilità sembrano perfettamente equilibrate, infatti la sfida si conclude con un "
    "pareggio! Dopo la sfida ognuno si allontana per la propria strada, sapendo di essersi fatto "
    "dei nuovi amici.",
};

static const unk8* _806A63C[5] = {
    "{A19}{Q}{C13}\"Thank you for coming... Ah, my favorite blading team, the "
    "Psykicks!!\"{c}<\f>{U}{C14}Kane{c}{A4}... {C14}Jim{c}{a22}...<\f>{f}{C14}Goki{c}{A20}... "
    "and the lovely {f}{C14}Salima{c}{a27}...<\f>{b}{B}{C14}Gideon{c} and {C14}Doctor B{c} show "
    "Team Psykick how to use the new Cyber Bit Beasts, which they seem more than capable of "
    "handling...<\f>{C14}Doctor B{c}{a16} has gone to {C14}Mr. Dickenson's{c}{A25} office to "
    "place an official challenge against the Bladebreakers. <\f>{q}{C13}\"Mr. Dickenson, you're "
    "refusing my humble request for another formal match against the Bladebreakers?\" "
    "{c}<\f>{u}{Q}{C12}\"I certainly am! You want nothing more than to steal their Bit "
    "Beasts!<\f>Your Psykick team is simply a front for whatever sinister scheme you and your "
    "men are hatching!\" {c}<\f>{U}{q}{C13}\"Are you familiar with monster movies by any "
    "chance?<\f>Like the giant lizard that destroyed Tokyo, my Cyber Bit Beasts will crush this "
    "city like a bug!<\f>Unlike normal Bit Beasts, my creations can take physical form and go "
    "rampaging on my command!\" {c}<\f>{u}{A10}{Q}{C12}\"Nooo!!\" {c}<\f>{U}The Bladebreakers "
    "burst into the room! <\f>{A6}{Q}{C12}\"The only rampage he's gonna get is from "
    "us!\"{c}<\f>{U}{q}{C13}\"It appears the Bladebreakers have accepted my latest challenge!\" "
    "{c}<\f>{u}{B}{b}Some time later, {C14}Tyson{c} is disappointed to learn that his new "
    "friends {C14}Kane{c}, {C14}Jim{c}, {C14}Goki{c} and {C14}Salima{c} have joined with Team "
    "Psykick.",
    "{A19}{Q}{C13}\"Gracias por venir... Ah, mi equipo de peonzas favorito, ¡los "
    "Psykicks!!...\"{c}<\f>{U}{C14}Kane{c}{A4}...{C14}Jim{c}{a22}...<\f>{f}{C14}Goki{c}{A20}... "
    "y la encantadora {f}{C14}Salima{c}{a27}...<\f>{b}{B}{C14}Gideon{c} y el {C14}Doctor B{c} "
    "enseñan al equipo Psykick a usar los nuevos Cíber Bit Beasts, y todos parecen más que "
    "capacitados para manejarlos...<\f>El {C14}Doctor B{c}{a16} ha ido a la oficina del {C14}Sr. "
    "Dickenson{c}{A25} para presentar un reto oficial contra los Bladebreakers. "
    "<\f>{q}{C13}\"Sr. Dickenson... ¿Está usted rechazando mi humilde petición de otro encuentro "
    "formal contra los Bladebreakers?\" {c}<\f>{u}{Q}{C12}\"¡Por supuesto que lo estoy haciendo! "
    "¡Lo único que quiere es robar sus Bit Beasts! ¡Su equipo Psykick no es más que una fachada "
    "para cualquier siniestro plan que usted y sus hombres estén tramando!\" "
    "{c}<\f>{U}{q}{C13}\"¿Está usted familiarizado con las películas de monstruos, por "
    "casualidad? Como la del lagarto gigante que destruyó Tokio... ¡Mis Cíber Bit Beasts "
    "aplastarán esta ciudad como a un insecto! Al contrario que los Bit Beasts normales, mis "
    "creaciones pueden adquirir forma física y destruirlo todo a mi antojo\" "
    "{c}<\f>{u}{A10}{Q}{C12}\"¡¡Nooo!!\" {c}<\f>{U}Los Bladebreakers entran de golpe en la "
    "habitación<\f>{A6}{Q}{C12}\"¡La única destrucción que va a obtener es la "
    "nuestra!\"{c}<\f>{U}{q}{C13}\"¡Parece que los Bladebreakers han aceptado mi último reto!\" "
    "{c}<\f>{u}{B}{b}Poco tiempo después, {C14}Tyson{c} se siente defraudado al enterarse de que "
    "sus nuevos amigos, {C14}Kane{c}, {C14}Jim{c}, {C14}Goki{c} y {C14}Salima{c} se han unido al "
    "equipo Psykick.",
    "{A19}{Q}{C13}\"Danke, dass ihr gekommen seid... Ah, mein Lieblings-Blading Team, die "
    "Psykicks!\"{c}<\f>{U}{C14}Kane{c}{A4}... {C14}Jim{c}{a22}... <\f>{f}{C14}Goki{c}{A20}... "
    "und die reizende {f}{C14}Salima{c}{a27}...<\f>{b}{B}{C14}Gideon{c} und {C14}Doctor B{c} "
    "zeigen dem Team Psykick, wie man die neuen Cyber-Bit Beasts einsetzt. Das Team kommt "
    "hervorragend mit ihnen zurecht...<\f>{C14}Doctor B{c}{a16} hat {C14}Mr. Dickensons{c}{A25} "
    "Büro aufgesucht, um ihm eine offizielle Herausforderung an die Bladebreakers zu "
    "übermitteln. <\f>{q}{C13}\"Mr. Dickenson... Sie lehnen meinen bescheidenen Wunsch nach "
    "einem weiteren offiziellen Kampf gegen die Bladebreakers ab?\" {c}<\f>{u}{Q}{C12}\"Und ob "
    "ich das tue! Sie wollen ja nur ihre Bit Beasts stehlen! Ihr Team Psykick ist lediglich ein "
    "Vorwand für einen üblen Plan, den Sie und Ihre Männer ausgeheckt haben!\" "
    "{c}<\f>{U}{q}{C13}\"Kennen Sie eigentlich Monster-Filme? Wie diese riesige Echse, die Tokio "
    "zerstört. Meine Bit Beasts werden diese Stadt wie eine Wanze zerstampfen! Und, anders als "
    "normale Bit Beasts, können meine Wesen eine physische Form annehmen und auf meinen Befehl "
    "hin alles vernichten\" {c}<\f>{u}{A10}{Q}{C12}\"Neeein!\" {c}<\f>{U}Die Bladebreakers "
    "stürmen in den Raum. <\f>{A6}{Q}{C12}\"Sie sind es, der vernichtet "
    "wird!\"{c}<\f>{U}{q}{C13}\"Es scheint, als hätten die Bladebreakers die neue "
    "Herausforderung angenommen!\" {c}<\f>{u}{B}{b}Einige Zeit später muss {C14}Tyson{c} zu "
    "seiner Enttäuschung erfahren, dass seine neuen Freunde {C14}Kane{c}, {C14}Jim{c}, "
    "{C14}Goki{c} und {C14}Salima{c} dem Team Psykick beigetreten sind.",
    "{A19}{Q}{C13}\"Merci d'être venus... Ah, voilà mon équipe préférée, les "
    "Psykicks!\"{c}<\f>{U}{C14}Kane{c}{A4}... {C14}Jim{c}{a22}...<\f>{f}{C14}Goki{c}{A20}... et "
    "la jolie {f}{C14}Salima{c}{a27}...<\f>{b}{B}{C14}Gideon{c} et le {C14}docteur B{c} montrent "
    "à l'équipe Psykick comment utiliser leurs nouveaux Cyber Bit Beasts, qu'ils semblent "
    "parfaitement capables de contrôler...<\f>Le {C14}docteur B{c}{a16} est parti au bureau de "
    "{C14}M. Dickenson{c}{A25} afin de lancer un défi officiel aux "
    "Bladebreakers.<\f>{q}{C13}\"M. Dickenson, vous refusez mon humble demande de nouveau match "
    "officiel contre les Bladebreakers?\" {c}<\f>{u}{Q}{C12}\"Certainement! Vous ne voulez "
    "qu'une chose: leur voler leurs Bit Beasts! Votre équipe Psykick n'est qu'une facde pour le "
    "sinistre complot que vous préparez avec vos hommes!\" {c}<\f>{U}{q}{C13}\"Est-ce que vous "
    "connaissez les films de monstres? Comme celui où un lézard géant détruisait Tokyo... Mes "
    "Cyber Bit Beasts vont écraser cette ville comme une mouche! Contrairement aux Bit Beasts, "
    "mes créations peuvent prendre une forme physique et tout ravager sur mon ordre!\" "
    "{c}<\f>{u}{A10}{Q}{C12}\"Nooon!\" {c}<\f>{U}Les Bladebreakers entrent en trombe dans le "
    "bureau. <\f>{A6}{Q}{C12}\"C'est nous qui allons le ravager!\"{c}<\f>{U}{q}{C13}\"Il semble "
    "que les Bladebreakers viennent d'accepter mon nouveau défi!\" {c}<\f>{u}{B}{b}Un peu plus "
    "tard, {C14}Tyson{c} est déçu d'apprendre que ses nouveaux amis {C14}Kane{c}, {C14}Jim{c}, "
    "{C14}Goki{c} et {C14}Salima{c} ont rejoint les rangs de l'équipe Psykick.",
    "{A19}{Q}{C13}\"Grazie per essere venuto. Ah, la mia squadra di Beyblader preferita, gli "
    "Psykicks!\"{c}<\f>{U}{C14}Kane{c}{A4}...{C14}Jim{c}{a22}...<\f>{f}{C14}Goki{c}{A20}... e "
    "l'adorabile {f}{C14}Salima{c}{a27}...<\f>{b}{B}{C14}Gideon{c} e il {C14}Dottor B{c} "
    "spiegano alla squadra Psykicks come si usano i nuovi Cyber Bit Beast. Tutti si dimostrano "
    "più che capaci di controllarli.<\f>Il {C14}Dottor B{c}{a16} si reca nell'ufficio di "
    "{C14}Mr. Dickenson{c}{A25} per lanciare una sfida ufficiale contro i "
    "Bladebreakers.<\f>{q}{C13}\"Mr. Dickenson... lei rifiuta la mia umile richiesta di un'altra "
    "battaglia formale contro i Bladebreakers?\" {c}<\f>{u}{Q}{C12}\"Ma certo! Lei vuole "
    "soltanto rubare i loro Bit Beast! La sua squadra Psykicks è soltanto la facciata di qualche "
    "sinistro piano che lei sta tramando con i suoi uomini!\" {c}<\f>{U}{q}{C13}\"Per caso, lei "
    "ha visto qualche film di mostri? Come quello sulla lucertola gigante che ha distrutto "
    "Tokyo... I miei Cyber Bit Beast schiacceranno questa città come se fosse un insetto. A "
    "differenza dei Bit Beast, normali, le mie creazioni possono assumere una forma fisica e "
    "scatenare il caos ai miei ordini!\" {c}<\f>{u}{A10}{Q}{C12}\"Nooo!\" {c}<\f>{U}I "
    "Bladebreakers irrompono nella stanza.<\f>{A6}{Q}{C12}\"L'unico caos che vedrai sarà quello "
    "in cui ti getteremo noi!\"{c}<\f>{U}{q}{C13}\"Sembra che i Bladebreakers abbiano accettato "
    "la mia ultima sfida!\" {c}<\f>{u}{B}{b}Qualche tempo dopo, {C14}Takao{c} è deluso per aver "
    "scoperto che i suoi nuovi amici, {C14}Kane{c}, {C14}Jim{c}, {C14}Goki{c} e {C14}Salima{c}, "
    "si sono uniti alla squadra Psykicks.",
};

static const unk8* _806A650[5] = {
    "{C14}Tyson{c} {A10}is worried about the forthcoming battle with Team Psykick and their "
    "incredibly powerful Cyber Bit Beasts...<\f>{Q}{C12}\"{C14}Kenny{c}{a5}, do you think you "
    "could give my BeyBlade a radical tune-up before my match?\" {c}<\f>{U}{q}{C12}\"It needs a "
    "tune-up?\"{c}<\f>{u}{Q}{C12}\"Yeah, it would be great if you could double the disk weight "
    "or even triple the attack ring. You know, anything that could help me win the match.\" "
    "{c}<\f>{U}{q}{C12}\"Huh??"
    "!!\" {c}<\f>{u}{a6}{q}{C12}\"No way {C14}Tyson{c}! You can't illegally modify your "
    "BeyBlade. You know that's against the rules!\" {c}<\f>{u}{Q}{C12}\"Yeah, well I don't stand "
    "a chance against Team Psykick and their Cyber Bit Beasts.\"{c}",
    "{C14}Tyson{c} {A10}está preocupado por la batalla que se aproxima con el equipo Psykick y "
    "los increíblemente poderosos Ciber Bit Beasts...<\f>{Q}{C12}\"{C14}Kenny{c}{a5}, ¿crees que "
    "podrías hacer una puesta a punto radical a mi Peonza antes de mi encuentro?\" "
    "{c}<\f>{U}{q}{C12}\"¿Necesita una puesta a punto?\"{c}<\f>{u}{Q}{C12}\"Sí, estaría genial "
    "si pudieras duplicar la Pesa del disco o incluso triplicar el Anillo de ataque. Ya sabes, "
    "cualquier cosa que pudiera ayudarme a ganar el encuentro.\" {c}<\f>{U}{q}{C12}\"¡¡¿¿Cómo??"
    "!!\" {c}<\f>{u}{a6}{q}{C12}\"¡De ninguna manera, {C14}Tyson{c}! No puedes modificar "
    "ilegalmente tu Peonza. ¡Sabes que va contra las reglas!\" {c}<\f>{u}{Q}{C12}\"Ya, vale; no "
    "tengo ninguna oportunidad contra el equipo Psykick y sus Cíber Bit Beasts.\" {c}",
    "{C14}Tyson{c} {A10} ist besorgt über den anstehenden Kampf mit dem Team Psykick und ihre "
    "unglaublich mächtigen Cyber-Bit Beasts...<\f>{Q}{C12}\"{C14}Kenny{c}{a5}, glaubst du, du "
    "kannst mein Beyblade vor dem Match ein wenig auffrisieren?\" {c}<\f>{U}{q}{C12}\"Willst du "
    "es aufrüsten?\"{c}<\f>{u}{Q}{C12}\"Ja. Vielleicht kannst du das Gewicht der Scheiben "
    "erhöhen oder den Power-Ring verstärken. Irgendetwas, was mir im Kampf helfen könnte.\" "
    "{c}<\f>{U}{q}{C12}\"Was?!\" {c}<\f>{u}{a6}{q}{C12}\"Unmöglich, {C14}Tyson{c}! Du darfst "
    "dein Beyblade nicht auf diese Weise modifizieren. Das verstößt gegen die Regeln, und du "
    "weißt das auch!\" {c}<\f>{u}{Q}{C12}\"Tja, dann habe ich wohl keine Chance gegen das Team "
    "Psykick und ihre Cyber-Bit Beasts.\" {c}",
    "{C14}Tyson{c} {A10}s'inquiète au sujet du prochain match avec l'équipe Psykick et ses "
    "incroyablement puissants Cyber Bit Beasts...<\f>{Q}{C12}\" {C14}Kenny{c}{a5}, tu penses que "
    "tu pourrais améliorer les réglages de mon Beyblade avant mon match?\" "
    "{c}<\f>{U}{q}{C12}\"Il a besoin de réglages?\"{c}<\f>{u}{Q}{C12}\"Ouais, ce serait bien si "
    "tu pouvais doubler le disque lesté ou même tripler l'anneau d'attaque. Tu sais, tout ce qui "
    "pourrait m'aider à gagner le match...\" {c}<\f>{U}{q}{C12}\"Hein??"
    "!!\" {c}<\f>{u}{a6}{q}{C12}\"Pas question, {C14}Tyson{c}! Tu ne peux pas modifier ton "
    "Beyblade illégalement. Tu sais que c'est contraire au règlement!\" "
    "{c}<\f>{u}{Q}{C12}\"Ouais, eh ben alors je n'ai aucune chance contre l'équipe Psykick et "
    "ses Cyber Bit Beasts.\" {c}",
    "{C14}Takao{c} {A10}è preoccupato della battaglia contro la squadra Psykicks e i loro "
    "potentissimi Cyber Bit Beast...<\f>{Q}{C12}\" {C14}Prof. Kappa{c}{a5}, credi di poter dare "
    "una revisione generale al mio Beyblade prima che io debba combattere?\" "
    "{c}<\f>{U}{q}{C12}\"Ne ha bisogno?\"{c}<\f>{u}{Q}{C12}\"Sì, sarebbe un'ottima idea se tu "
    "potessi raddoppiare il peso o perfino triplicare il disco d'attacco. Insomma, tutto ciò che "
    "mi possa aiutare a vincere.\" {c}<\f>{U}{q}{C12}\"Eh?!\" {c}<\f>{u}{a6}{q}{C12}\"Niente da "
    "fare, {C14}Takao{c}! Non puoi modificare illegalmente il tuo Beyblade. Sai che è contro le "
    "regole!\" {c}<\f>{u}{Q}{C12}\"Va bene. Allora non ho speranze contro la squadra Psykicks e "
    "i suoi Cyber Bit Beast.\" {c}",
};

static const unk8* _806A664[5] = {
    "{C14}Tyson{c} gets {C14}Kenny{c} to adapt his blade so that it has maximum attack power. "
    "This makes his Dragoon illegal under BBA rules.<\f>The other problem is that {C14}Tyson{c} "
    "can't handle the blade. It's too powerful and keeps on losing balance. "
    "<\f>{C14}Ozuma{c}{a8} meets up with {C14}Tyson{c}{A10} and they end up having a "
    "battle...<\f>{t2}{q}{C13}\"Ready when you are!\" {c}<\f>{u}{Q}{C12}\"Wanna play rough? "
    "Okay, then let's do it!{f4}!\" {c}<\f>{U}{C14}Ozuma{c} easily defeats {C14}Tyson's{c} "
    "blade...<\f>{q}{C13}\"Hate to say I told ya so, but I told ya so!\" "
    "{c}<\f>{u}{a9}{q}{C12}\"It's because you messed with your blade...\" {c}<\f>{u}{Q}{C12}\"Ah "
    "man, am I ever dumb! Ever since Chief tweaked my blade, I changed my whole style.<\f>I was "
    "counting on my blade to do all the work and that's not how I used to play! That's why "
    "Dragoon never came out!<\f>I can't believe I was such a goofball!! Hey Chief... you think "
    "you can make the way it used to be?\"{c}",
    "{C14}Tyson{c} consigue que {C14}Kenny{c} adapte su peonza para que tenga poder de ataque "
    "máximo, lo cual hace que su Dragón sea ilegal, según las reglas de la ABP. El otro problema "
    "es que {C14}Tyson{c} no puede controlar la peonza ;es demasiado potente y pierde el "
    "equilibrio todo el rato.<\f>{C14}Ozuma{c}{a8} se reúne con {C14}Tyson{c}{A10} y terminan "
    "teniendo una batalla...<\f>{t2}{q}{C13}\"¡Estoy listo cuando tú lo estés!\" "
    "{c}<\f>{u}{Q}{C12}\"Quieres jugar duro... De acuerdo, ¡hagámoslo{f4}!\" "
    "{c}<\f>{U}{C14}Ozuma{c} derrota fácilmente a la peonza de "
    "{C14}Tyson{c}...<\f>{Q}{C12}\"Odio decir que ya te lo dije, ¡pero ya te lo dije!...\" "
    "{c}<\f>{U}{a9}{q}{C12}\" Eso te pasa por manipular tu peonza...\" {c}<\f>{u}{Q}{C12}\"Ah, "
    "tío, ¡qué tonto soy! Desde que el jefe manipuló mi peonza, mi estilo cambió por completo. "
    "Contaba con la peonza para que hiciera todo el trabajo ¡y así no es cómo solía trabajar! "
    "¡Por eso Dragón nunca salió! ¡No puedo creer que haya sido tan tonto!, Eh, jefe, ¿crees que "
    "puedes hacer que sea como antes?\"{c}",
    "{C14}Tyson{c} bringt {C14}Kenny{c} dazu, sein Beyblade so zu verändern, dass es maximale "
    "Angriffskraft hat. Dies verstößt klar gegen die Regeln der BBA. Das andere Problem ist, "
    "dass {C14}Tyson{c} sein neues, mächtigeres Beyblade kaum beherrscht und es immer wieder das "
    "Gleichgewicht verliert. <\f>{C14}Ozuma{c}{a8} trifft sich mit {C14}Tyson{c}{A10}, und es "
    "kommt zu einem Kampf...<\f>{t2}{q}{C13}\"Bereit, wenn du es bist!\" {c}<\f>{u}{Q}{C12}\"Du "
    "willst es auf die harte Tour versuchen. OK, kannst du haben{f4}!\" {c}<\f>{U}{C14}Ozuma{c} "
    "schlägt das Blade von {C14}Tyson{c} mit Leichtigkeit...<\f>{Q}{C12}\"Hab's dir gesagt, aber "
    "du wolltest ja nicht hören!\" {c}<\f>{U}{a9}{q}{C12}\"Das kommt davon, dass du dein Blade "
    "verändert hast...\" {c}<\f>{u}{Q}{C12}\"Oh, Mann! Bin ich blöd! Seit der Chef mein Blade "
    "geändert hat, habe ich meinen Stil geändert. Ich habe mich ganz einfach auf das Blade "
    "verlassen, aber das ist nicht mein normaler Stil! Und darum kam auch Dragoon nicht zur "
    "Geltung! Kaum zu glauben, wie dämlich ich war! Hey, Chef, kriegst du mein Blade wieder so "
    "hin, wie es vorher war?\"{c}",
    "{C14}Tyson{c} parvient à décider {C14}Kenny{c} de modifier son Beyblade afin de lui donner "
    "la puissance d'attaque maximale, ce qui rend son Dragoon illégal selon le règlement. Mais "
    "il y a un autre problème: {C14}Tyson{c} ne parvient pas à contrôler son Beyblade qui est "
    "devenu trop puissant et perd son équilibre. <\f>{C14}Ozuma{c}{a8} rencontre "
    "{C14}Tyson{c}{A10} et ils finissent par s'affronter... <\f>{t2}{q}{C13}\"Quand tu veux!\" "
    "{c}<\f>{u}{Q}{C12}\"Tu veux la jouer dure... D'accord, allons-y {f4}!\" "
    "{c}<\f>{U}{C14}Ozuma{c} bat facilement le Beyblade de {C14}Tyson{c}.<\f>{Q}{C12}\"Je "
    "déteste avoir à te dire cela, mais je te l'avais bien dit! \" {c}<\f>{U}{a9}{q}{C12}\"C'est "
    "parce que tu as fait n'importe quoi avec ton Beyblade...\" {c}<\f>{u}{Q}{C12}\"Ah, ce que "
    "je peux être bête. Depuis que le chef a modifié mon blade, j'ai complètement changé de "
    "style. Je comptais sur mon blade pour faire tout le travail à ma place, ce que je n'ai "
    "jamais fait! C'est pour cela que Dragoon n'est jamais sorti! Je n'arrive pas à croire que "
    "j'ai été aussi stupide! Eh, chef... tu penses que tu peux remettre mon Beyblade comme il "
    "était avant?\"{c}",
    "{C14}Takao{c} convince il {C14}Prof. Kappa{c} ad adattare il suo Beyblade in modo che abbia "
    "un enorme potenza d'attacco, rendendo però illegale il suo Dragoon secondo le regole della "
    "BBA. L'altro problema è che {C14}Takao{c} non riesce a controllare il Beyblade: è troppo "
    "potente e continua a perdere l'equilibrio.<\f>{C14}Ozuma{c}{a8} incontra {C14}Takao{c}{A10} "
    "fra loro inizia la battaglia.<\f>{t2}{q}{C13}\"Se tu sei pronto, lo sono anch'io!\" "
    "{c}<\f>{u}{Q}{C12}\"Vuoi il gioco pesante? Va bene, giochiamo{f4}!\" "
    "{c}<\f>{U}{C14}Ozuma{c} sconfigge con facilità il Beyblade di "
    "{C14}Takao{c}.<\f>{Q}{C12}\"Odio dovertelo dire, ma te l'avevo detto!\" "
    "{c}<\f>{U}{a9}{q}{C12}\"È successo perché hai pasticciato con il tuo Beyblade...\" "
    "{c}<\f>{u}{Q}{C12}\"Accidenti, sono uno stupido! Da quando il capo ha modificato il mio "
    "Beyblade, ho cambiato anche il mio stile. Contavo che facesse lui tutto il lavoro, ma non "
    "sono abituato a battermi in questo modo. Ecco perché il Dragoon non è mai uscito! Non posso "
    "credere di essere stato tanto idiota! Ehi, capo, credi di poterlo far tornare come "
    "prima?\"{c}",
};

static const unk8* _806A678[5] = {
    "It's time for the Bladebreakers' big match against Team Psykick. The stakes are "
    "high.<\f>They could easily lose their Bit Beasts to {C14}Gideon's{c} team and their super "
    "powered Cyber Bit Beasts. <\f>Mr. Dickenson has arranged for a helicopter to take the "
    "Bladebreakers to the match. <\f>{A5}{Q}{C12}\"Wow, there it is! Our venue. An arena the "
    "Psykicks colorfully call the 'Battle Tower'.\"{c}<\f>{U}{B}The chopper lands at the base of "
    "the huge imposing structure and the Breakers move inside...<\f>{t1}{a19}{q}{C13}\"Within "
    "this glorious Battle Tower there are five distinct floors. <\f>Above the ground floor on "
    "which you're standing, floors two to five all contain Beystadiums.<\f>On each of these "
    "floors, one highly trained member of Team Psykick awaits your arrival. Thus, there will be "
    "four Beybattles in total.\" {c}<\f>{u}{b}Once the Bladebreakers reach the second floor, the "
    "first battle begins: {C14}Max{c}{A6} vs {C14}Jim{c}{a22}...<\f>{t2}{q}{C13}\"Your friends "
    "can't help you. You'll have to face little ol' me all by your lonesome!\" "
    "{c}<\f>{u}{Q}{C12}\"Little ol' you...is gonna lose{f4}!\"{c}",
    " Es la hora del gran encuentro de los Bladebreakers contra el equipo Psykick, el riesgo es "
    "elevado; podrían perder fácilmente sus Bit Beasts frente al equipo de {C14}Gideon{c} con "
    "sus Cíber Bit Beast superpoderosas. <\f>El Sr. Dickenson ha conseguido que un helicóptero "
    "lleve a los Bladebreakers al encuentro. <\f>{A5}{Q}{C12}\"Guau, ¡ahí está! Nuestro "
    "escenario; una arena que los Psykicks llaman coloridamente la 'Torre de "
    "batalla'\"{c}<\f>{U}{B}El helicóptero aterriza en la base de la enorme e imponente "
    "estructura, y los Breakers pasan al interior...<\f>{t1}{a19}{q}{C13}\"Dentro de la gloriosa "
    "Torre de batalla hay cinco plantas distintas. Por encima de la planta baja, en la que os "
    "encontráis ahora, los pisos dos al cinco contienen todos Beystadium. En cada una de esas "
    "plantas, un miembro del equipo Psykick perfectamente entrenado espera vuestra llegada. Así "
    "que habrá cuatro Bey battles en total.\" {c}<\f>{u}{b}En cuanto los Breakers llegan a la "
    "segunda planta, la primera batalla comienza: {C14}Max{c}{A6} contra "
    "{C14}Jim{c}{a22}...<\f>{t2}{q}{C13}\"Tus amigos no pueden ayudarte... ¡Tendrás que "
    "enfrentarte a mí tú solito!\" {c}<\f>{u}{Q}{C12}\"¡Pues tú solito eres el que va a "
    "perder{f4}!\"{c}",
    "Jetzt ist die Zeit gekommen für den großen Kampf der Bladebreakers gegen das Team Psykick. "
    "Das Risiko für das Team der Bladebreakers ist hoch. Sie könnten ihre Bit Beasts an "
    "{C14}Gideons{c} Team mit den mächtigen Cyber-Bit Beasts verlieren. <\f>Mr. Dickenson hat "
    "einen Helikopter bestellt, um die Bladebreakers zum Kampf zu bringen. "
    "<\f>{A5}{Q}{C12}\"Wow, da ist es! Eine Bey-Arena, die das Team Psykick den 'Battle Tower' "
    "nennt.'\"{c}<\f>{U}{B}Der Helikopter landet und die Bladebreakers begeben sich nach "
    "drinnen...<\f>{t1}{a19}{q}{C13}\"Innerhalb dieses mächtigen Battle Towers gibt es fünf "
    "verschiedene Levels. Oberhalb des Levels, auf dem ihr euch jetzt befindet, gibt es von "
    "Level zwei bis fünf jeweils eine Bey-Arena. Auf jedem Level wartet ein Mitglied des Teams "
    "Psykick auf euch. Damit finden also insgesamt vier Beyblade-Kämpfe statt.\" "
    "{c}<\f>{u}{b}Als die Bladebreakers das zweite Level erreichen, beginnt der erste Kampf: "
    "{C14}Max{c}{A6} gegen {C14}Jim{c}{a22}...<\f>{t2}{q}{C13}\"Deine Freunde können dir nicht "
    "helfen. Du musst es schon allein mit meiner Wenigkeit aufnehmen!\" "
    "{c}<\f>{u}{Q}{C12}\"Deine Wenigkeit... wird verlieren {f4}!\"{c}",
    "L'heure du grand match entre les Bladebreakers et l'équipe Psykick est arrivée. Les enjeux "
    "sont énormes: l'équipe de {C14}Gideon{c}, avec ses Cyber Bit Beasts surpuissants, pourrait "
    "bien leur ravir leurs Bit Beasts. <\f>M. Dickenson a fait en sorte qu'un hélicoptère amène "
    "les Bladebreakers au match.<\f>{A5}{Q}{C12}\" Wouah, on y est! Notre site. Une arène que "
    "les Psykicks appellent la 'tour de combat'.\"{c}<\f>{U}{B}L'hélicoptère se pose au pied de "
    "l'imposante structure dans laquelle entrent les Breakers...<\f>{t1}{a19}{q}{C13}\"Cette "
    "glorieuse tour de combat comporte cinq niveaux. Au-dessus du rez-de-chaussée où vous vous "
    "trouvez, les niveaux 2 à 5 contiennent des Beystadiums. A chacun de ces niveaux, un membre "
    "très bien entraîné de l'équipe Psykick attend votre arrivée. Il y aura ainsi au total "
    "quatre combats.\" {c}<\f>{u}{b}Lorsque les Bladebreakers rejoignent le deuxième niveau, la "
    "première bataille commence: {C14}Max{c}{A6} contre {C14}Jim{c}{a22}...<\f>{t2}{q}{C13}\"Tes "
    "amis ne pourront pas t'aider. Tu vas devoir m'affronter tout seul!\" {c}<\f>{u}{Q}{C12}\"Et "
    "tu vas perdre... tout seul {f4}!\"{c}",
    "È arrivato il momento della grande sfida dei Bladebreakers contro la squadra Psykicks. La "
    "posta in palio è alta: rischiano di farsi prendere i loro Bit Beast dalla squadra di "
    "{C14}Gideon{c}, che usa i suoi potentissimi Cyber Bit Beast.<\f>Mr. Dickenson ha inviato un "
    "elicottero per portare i Bladebreakers sul luogo dell'incontro.<\f>{A5}{Q}{C12}\"Wow, ci "
    "siamo! Il nostro stadio. Un'arena che la squadra Psykicks chiama Torre delle "
    "battaglie.\"{c}<\f>{U}{B}L'elicottero atterra presso la base dell'imponente struttura e i "
    "Bladebreakers vi entrano...<\f>{t1}{a19}{q}{C13}\"Nella gloriosa Torre delle battaglie ci "
    "sono cinque piani diversi. Sopra il piano terra, dove vi trovate adesso, ce ne sono altri "
    "quattro, che ospitano altrettanti stadi Beyblade. A ciascun piano vi attende un membro "
    "altamente addestrato della squadra Psykicks. Dunque, ci saranno in totale quattro battaglie "
    "di Beyblade.\" {c}<\f>{u}{b}Quando i Bladebreakers saranno arrivati al primo piano, "
    "inizierà la prima battaglia: {C14}Max{c}{A6} contro {C14}Jim{c}{a22}.<\f>{t2}{q}{C13}\"I "
    "tuoi amici non potranno aiutarti. Mi dovrai affrontare da solo!\" {c}<\f>{u}{Q}{C12}\"E da "
    "solo perderai{f4}!\"{c}",
};

static const unk8* _806A68C[5] = {
    "{A6}{a22}{Q}{C12}\"Don't give up on me now, buddy. Nothing compares to you. That Cyber Bit "
    "Beast is just a pale imitation. I know we can take him down! "
    "Dracieeeeeeel!...Attaaaaaaaack!\" {c}<\f>{U}{q}{C13}\"Oh no!\" "
    "{c}<\f>{u}{t3}{Q}{C12}\"Draciel!... You did it!\" {c}<\f>{U}{a10}{q}{C12}\"Hey, what's "
    "going on?\" {c}<\f>{u}{a15}{C12}\"I'm no mechanic, but from what I see, it looks like Cyber "
    "Draciel over there is getting a tune-up!\" {c}<\f>{u}{a3}{q}{C12}\"A Cyber Bit Beast "
    "repairing machine.\"{c}<\f>{u}{a9}{q}{C12}\"This battle's never gonna end!\" "
    "{c}<\f>{u}{Q}{C12}\"Draciel's a tough cookie... but even he can't fight a battle that goes "
    "on forever while his enemy keeps fixing himself! We're sunk!\"{c}{U}",
    "{A6}{a22}{Q}{C12}\"No me falles ahora, colega. Nada se puede comparar a ti. Ese Cíber Bit "
    "Beast no es más que una mala imitación. ¡Sé que podemos derribarle!, ¡Dracieeeeeeel!... "
    "¡Ataaaaaaaaca!\" {c}<\f>{U}{q}{C13}\"¡Oh, no!\" {c}<\f>{u}{t3}{Q}{C12}\"¡Draciel!.. ¡Lo "
    "conseguiste!\" {c}<\f>{U}{a10}{q}{C12}\"Oye, ¿qué está pasando?\" {c}<\f>{u}{a15}{C12}\"No "
    "soy mecánica pero, por lo que veo, parece que el Cíber Draciel ¡está siendo puesto a "
    "punto!\" {c}<\f>{u}{a3}{q}{C12}\"Un Cíber Bit Beast que hace de máquina "
    "reparadora.\"{c}<\f>{u}{a9}{q}{C12}\"¡Esta batalla no va a terminar nunca!\" "
    "{c}<\f>{u}{Q}{C12}\"Draciel es un chico duro... Pero ni siquiera él puede pelear en una "
    "batalla que dura eternamente, ¡mientras su enemigo se repara a sí mismo! ¡Estamos "
    "hundidos!\"{c}",
    "{A6}{a22}{Q}{C12}\"Lass mich jetzt nicht hängen, Kumpel. Du bist die Nummer Eins. Dieses "
    "Cyber-Bit Beast ist nur ein schwacher Abklatsch. Wir können es besiegen! Dracieeeeeeel! "
    "Attaaaaaaaacke!!\" {c}<\f>{U}{q}{C13}\"Oh nein!\" {c}<\f>{u}{t3}{Q}{C12}\"Draciel! Du hast "
    "es geschafft!\" {c}<\f>{U}{a10}{q}{C12}\"Hey, was geht hier vor?\" "
    "{c}<\f>{u}{a15}{C12}\"Ich bin kein Mechaniker, aber ich glaube, dass der Cyber-Draciel da "
    "drüben gerade aufgerüstet wird!\" {c}<\f>{u}{a3}{q}{C12}\"Eine Cyber-Bit "
    "Beast-Reparatur-Maschine.\"{c}<\f>{u}{a9}{q}{C12}\"Dieser Kampf wird niemals enden!\" "
    "{c}<\f>{u}{Q}{C12}\"Draciel ist unglaublich zäh... Aber nicht mal er kann ewig weiter "
    "kämpfen, wenn sein Feind ständig repariert wird! Wir sind erledigt!\"{c}",
    "{A6}{a22}{Q}{C12}\"Ne laisse pas tomber, mon vieux. Personne ne peut te battre. Ce Cyber "
    "Bit Beast n'est qu'une pâle imitation. Je sais qu'on peut l'avoir! Dracieeeeeeel! A "
    "l'attaaaaaque!\" {c}<\f>{U}{q}{C13}\"Oh non!\" {c}<\f>{u}{t3}{Q}{C12}\"Draciel! Tu as "
    "réussi!\" {c}<\f>{U}{a10}{q}{C12}\"Eh, qu'est-ce qui se passe?\" {c}<\f>{u}{a15}{C12}\"Je "
    "ne suis pas mécano, mais vu d'ici, on dirait que Cyber Draciel a droit à une révision!\" "
    "{c}<\f>{u}{a3}{q}{C12}\"Une machine à réparer les Cyber Bit "
    "Beasts.\"{c}<\f>{u}{a9}{q}{C12}\"Ce combat ne finira jamais!\" {c}<\f>{u}{Q}{C12}\"Draciel "
    "est un dur à cuire... Mais même lui est incapable de gagner un combat si son adversaire se "
    "répare! Nous sommes finis!\"{c}",
    "{A6}{a22}{Q}{C12}\"Non mi deludere proprio adesso, ragazzo. Nulla ti sta alla pari. Quel "
    "Cyber Bit Beast è soltanto una pallida imitazione. So che possiamo batterlo! "
    "Dracieeeeeeel!... All'attaccoooooooooo!\" {c}<\f>{U}{q}{C13}\"Oh, no!\" "
    "{c}<\f>{u}{t3}{Q}{C12}\"Draciel! Ce l'hai fatta!\" {c}<\f>{U}{a10}{q}{C12}\"Ehi, che "
    "succede?\" {c}<\f>{u}{a15}{C12}\"Non sono un meccanico, ma da ciò che vedo sembra che quel "
    "Cyber Draciel stia ricevendo massicce riparazioni!\" {c}<\f>{u}{a3}{q}{C12}\"Una macchina "
    "per riparare i Cyber Bit Beast.\"{c}<\f>{u}{a9}{q}{C12}\"Questa battaglia non finirà mai!\" "
    "{c}<\f>{u}{Q}{C12}\"Il Draciel è molto resistente, ma neppure lui può battersi all'infinito "
    "contro un nemico capace di ripararsi da solo! Siamo fritti!\"{c}",
};

static const unk8* _806A6A0[5] = {
    "With his continuously repairing BeyBlade, {C14}Jim{c}{a22} faces off against "
    "{C14}Max{c}{A6}...<\f>{q}{C13}\"Come on, Cyber Draciel! Time to end this once and for all! "
    "That's it! Tear it to shreds!\" {c}<\f>{u}{Q}{C12}\"How can that be? Draciel!\" "
    "{c}<\f>{U}{b}{B}{C14}Doctor B's{c} computer system is trapping {C14}Max's{c} Draciel and "
    "draining its power...<\f>{A16}{Q}{C13}\"We've finally got him - Draciel, the great Bit "
    "Beast! Now that the Cyber Bit Beast system is operational, we can capture all four Bit "
    "Beasts. Initiate the next battle sequence!\" {c}<\f>{U}{a24}{q}{C13}\"We can't. The repair "
    "system won't re-start!\"{c}<\f>{u}{Q}{C13}\"Why not?\"{c}<\f>{U}{q}{C13}\"The main server "
    "must have been damaged by the shock wave from the battle.\"{c}<\f>{u}{Q}{C13}\"So fix it.\" "
    "{c}<\f>{U}{q}{C13}\"I can't.\" {c}<\f>{u}{Q}{C13}\"Unacceptable!... The battles will go on "
    "as scheduled. Do not worry - I have a backup plan in place.\"{c}",
    "Con su Peonza autorregenerante {C14}Jim{c}{a22} se enfrenta a "
    "{C14}Max{c}{A6}...<\f>{q}{C13}\"¡Vamos, Cíber Draciel! ¡Es hora de acabar con esto de una "
    "vez por todas! ¡Eso es! ¡Hazlo pedazos!\" {c}<\f>{u}{Q}{C12}\"¿Cómo puede ser? ¡Draciel!\" "
    "{c}<\f>{U}{b}{B}El sistema informático del {C14}Doctor B{c} atrapa el Draciel de "
    "{C14}Max{c} y absorbe su poder...<\f>{A16}{Q}{C13}\"Por fin le tenemos: Draciel, ¡el gran "
    "Bit Beast!, Ahora que el sistema Cíber Bit Beast es operativo, podemos capturar a los "
    "cuatro Bit Beasts. ¡Iniciad la siguiente secuencia de batalla!\" "
    "{c}<\f>{U}{a24}{q}{C13}\"¡No podemos, el sistema de reparación no se "
    "reinicia!\"{c}<\f>{u}{Q}{C13}\"¿Por qué no?\"{c}<\f>{U}{q}{C13}\"El servidor principal ha "
    "debido resultar dañado por la onda de choque de la batalla.\"{c}<\f>{u}{Q}{C13}\"Pues "
    "arréglalo.\" {c}<\f>{U}{q}{C13}\"No puedo.\" {c}<\f>{u}{Q}{C13}\"¡Inaceptable!... Las "
    "batallas seguirán según el plan. No os preocupéis; tengo un plan de reserva preparado.\"{c}",
    "Indem er immer wieder sein Beyblade repariert, bringt {C14}Jim{c}{a22} {C14}Max{c}{A6} in "
    "Bedrängnis...<\f>{q}{C13}\"Komm schon, Cyber-Draciel! Zeit, dies ein für alle Male zu "
    "beenden! Genau so! Reiß es in Stücke!\" {c}<\f>{u}{Q}{C12}\"Wie kann das sein? Draciel!\" "
    "{c}<\f>{U}{b}{B}{C14}Doctor Bs{c} Computersystem hält {C14}Max'{c} Draciel gefangen und "
    "entzieht ihm Energie...<\f>{A16}{Q}{C13}\"Jetzt haben wir ihn - Draciel, das große Bit "
    "Beast! Jetzt ist das Cyber-Bit Beast-System betriebsfähig und bereit, alle vier Bit Beasts "
    "gefangen zu nehmen!\" {c}<\f>{U}{a24}{q}{C13}\"Es geht nicht. Wir können das "
    "Reparatur-System nicht neu laden!\"{c}<\f>{u}{Q}{C13}\"Warum "
    "nicht?\"{c}<\f>{U}{q}{C13}\"Der Hauptserver scheint durch die Schockwelle des Kampfes "
    "beschädigt worden zu sein.\"{c}<\f>{u}{Q}{C13}\"Dann repariere ihn.\" "
    "{c}<\f>{U}{q}{C13}\"Das kann ich nicht.\" {c}<\f>{u}{Q}{C13}\"Das ist nicht akzeptabel! Der "
    "Kampf geht weiter wie geplant. Aber keine Sorge, ich habe noch einen zweiten Plan.\"{c}",
    "Avec son Beyblade qui se répare en permanence, {C14}Jim{c}{a22} tient tête à "
    "{C14}Max{c}{A6}...<\f>{q}{C13}\"Allez, Cyber Draciel, c'est le moment d'en finir! Vas-y! "
    "Mets-le en pièces!\" {c}<\f>{u}{Q}{C12}\"Comment est-ce possible? Draciel!\" "
    "{c}<\f>{U}{b}{B}Le Draciel de {C14}Max{c} est finalement vaincu et le système informatique "
    "du {C14}docteur B{c} le piège et le vide de sa puissance...<\f>{A16}{Q}{C13}\"Nous avons "
    "fini par l'avoir! Draciel, le grand Bit Beast! Maintenant que le système Cyber Bit Beast "
    "est opérationnel, nous pouvons capturer les quatre Bit Beasts. Lancez la séquence de combat "
    "suivante!\" {c}<\f>{U}{a24}{q}{C13}\"Impossible, le système de réparation refuse de "
    "redémarrer!\"{c}<\f>{u}{Q}{C13}\"Pourquoi?\"{c}<\f>{U}{q}{C13}\"Le serveur principal a dû "
    "être endommagé par l'onde de choc du combat.\"{c}<\f>{u}{Q}{C13}\"Alors, réparez-le.\" "
    "{c}<\f>{U}{q}{C13}\"Je ne peux pas.\" {c}<\f>{u}{Q}{C13}\"C'est intolérable! Les combats "
    "doivent se dérouler comme prévu. Ne vous en faites pas. J'ai un plan de rechange.\"{c}",
    "{C14}Jim{c}{a22}, con il suo Beyblade capace di ripararsi continuamente, affronta "
    "{C14}Max{c}{A6}.<\f>{q}{C13}\"Avanti, Cyber Draciel! È il momento di farla finita. Fallo a "
    "pezzi!\" {c}<\f>{u}{Q}{C12}\"Come può essere? Draciel!\" {c}<\f>{U}{b}{B}Il sistema di "
    "computer del {C14}Dottor B{c} sta intrappolando il Draciel di {C14}Max{c} per assorbire la "
    "sua energia.<\f>{A16}{Q}{C13}\"Finalmente l'abbiamo preso! Il Draciel, la grande bestia! "
    "Ora che il sistema dei Cyber Bit Beast è operativo, possiamo catturarli tutti e quattro. "
    "Iniziate la prossima sequenza di battaglia!\" {c}<\f>{U}{a24}{q}{C13}\"Non possiamo, il "
    "sistema di riparazione non si riavvia!\"{c}<\f>{u}{Q}{C13}\"Perché "
    "no?\"{c}<\f>{U}{q}{C13}\"Il server principale deve essere stato danneggiato dall'onda "
    "d'urto della battaglia.\"{c}<\f>{u}{Q}{C13}\"Allora riparalo.\" {c}<\f>{U}{q}{C13}\"Non "
    "posso.\" {c}<\f>{u}{Q}{C13}\"Inaccettabile! Ma le battaglie procederanno come previsto. Non "
    "c'è problema, ho un piano di riserva.\"{c}",
};

static const unk8* _806A6B4[5] = {
    "The Bladebreakers have realized that the Cyber Bit Beasts are actually "
    "possessing Team Psykick! <\f>{t2}{C14}Salima{c}{a27} is on the next "
    "level of {C14}Gideon's{c} Battle Tower, and she has chosen to fight "
    "{C14}Ray{c}{A9}... <\f>The battle rages furiously, and {C14}Salima{c}, "
    "with {C14}Ray's{c} help, manages to break free of the control the Cyber "
    "Driger has over her. <\f>{q}{C13}\"I'm gonna win this match... but I "
    "don't wanna beat you by using a bunch of cheap tricks!{f4}\"{c}",
    "Los Bladebreakers se han dado cuenta de que los Cíber Bit Beasts ¡están poseyendo al equipo "
    "Psykick! <\f>{t2}{C14}Salima{c}{a27} está en el nivel siguiente de la Torre de batalla de "
    "{C14}Gideon{c}, y ha elegido pelear contra {C14}Ray{c}{A9}... La batalla surge con furia y "
    "{C14}Salima{c}, con ayuda de {C14}Ray{c}, consigue liberarse del control que el Cíber "
    "Driger ejerce sobre ella. <\f>{q}{C13}\"Voy a ganar este encuentro... ¡Pero no quiero "
    "derrotarte usando un montón de trucos baratos!{f4}\"{c}",
    "Die Bladebreakers haben herausgefunden, dass das Team Psykick unter der mentalen Kontrolle "
    "der Cyber-Bit Beasts steht! <\f>{t2}{C14}Salima{c}{a27} wartet auf dem nächsten Level von "
    "{C14}Gideons{c} Battle Tower, und sie will gegen {C14}Ray{c}{A9} kämpfen... Während des "
    "heftigen Kampfes gelingt es {C14}Salima{c} mit {C14}Rays{c} Hilfe, sich der mentalen "
    "Kontrolle des Cyber-Driger zu entziehen. <\f>{q}{C13}\"Ich werde diesen Kampf gewinnen... "
    "Aber, um dich zu schlagen, brauche ich diese billigen Tricks nicht!{f4}\"{c}",
    "Les Bladebreakers ont compris que les Cyber Bit Beasts possédaient les "
    "membres de l'équipe Psykick! <\f>{t2}{C14}Salima{c}{a27} se trouve au "
    "niveau suivant de la tour de combat et a choisi d'affronter... "
    "{C14}Ray{c}{A9}... Le combat fait rage et {C14}Salima{c}, avec l'aide de "
    "{C14}Ray{c}, parvient à se libérer du contrôle que le Cyber Driger "
    "exerce sur elle. <\f>{q}{C13}\"Je vais gagner ce match... Mais je ne "
    "veux pas te battre en trichant!{f4}\"{c}",
    "I Bladebreakers hanno capito che i Cyber Bit Beast in realtà controllano "
    "la squadra Psykicks!<\f>{t2}{C14}Salima{c}{a27} si trova al piano "
    "superiore della Torre delle battaglie di {C14}Gideon{c} e ha scelto di "
    "affrontare {C14}Rey{c}{A9}. La battaglia infuria e {C14}Salima{c}, con "
    "l'aiuto di {C14}Rey{c}, riesce a liberarsi dal controllo che il Cyber "
    "Driger esercita su di lei. <\f>{q}{C13}\"Vincerò questa battaglia, ma "
    "non voglio batterti usando dei volgari trucchi!{f4}\"{c}",
};

static const unk8* _806A6C8[5] = {
    "{A9}{a27}{Q}{C12}\"Wake up, {C14}Salima{c}!\" {c}<\f>{U}{q}{C13}\"Wake up?! I'm wide awake! "
    "It's you who's having the nightmare!!\"{c}<\f>{u}{C14}Salima{c} is resisting the control of "
    "her Cyber Bit Beast!<\f>{q}{C13}\"I can't... stop it...!\" {c}<\f>{u}{Q}{C12}\"You've got "
    "to fight it!\"{c}<\f>{U}{t3}As she finally fully breaks the spell of the Cyber Bit Beast, "
    "{C14}Ray{c} wins the match. <\f>{q}{C13}\"I am so sorry, "
    "{C14}Ray{c}.\"{c}<\f>{u}{Q}{C12}\"{C14}Salima{c}! You know that this was all the Psykicks' "
    "fault!\" {c}<\f>{U}{q}{C13}\"{C14}Ray{c}... Thank you... for all of your help...\"{c}",
    "{A9}{a27}{Q}{C12}\"¡Despierta, {C14}Salima{c}!\" {c}<\f>{U}{q}{C13}\"¡¿Que despierte?! "
    "¡Estoy bien despierta! ¿Eres tú el que está teniendo una "
    "pesadilla!\"{c}<\f>{u}¡{C14}Salima{c} se resiste al control de su Cíber Bit "
    "Beast!<\f>{q}{C13}\"¡No puedo... detenerlo...!\" {c}<\f>{u}{Q}{C12}\"¡Tienes que "
    "pelear!\"{c}<\f>{U} {t3}Al conseguir romper finalmente el hechizo del Cíber Bit Beast, "
    "{C14}Ray{c} gana el encuentro. <\f>{q}{C13}\"Lo siento mucho, "
    "{C14}Ray{c}\"{c}<\f>{u}{Q}{C12}\"¡{C14}Salima{c}! ¡Sabes que todo esto ha sido culpa de los "
    "Psykicks!\" {c}<\f>{U}{q}{C13}\"{C14}Ray{c}... Gracias... por toda tu ayuda...\"{c}",
    "{A9}{a27}{Q}{C12}\"Wach auf, {C14}Salima{c}!\" {c}<\f>{U}{q}{C13}\"Aufwachen?! Ich bin "
    "wach! Du bist derjenige, der gerade einen Alptraum erlebt!\"{c}<\f>{u}{C14}Salima{c} "
    "widersetzt sich der Kontrolle ihres Cyber-Bit Beasts!<\f>{q}{C13}\"Ich kann nicht... "
    "Aufhören...!\" {c}<\f>{u}{Q}{C12}\"Du musst es bekämpfen!\"{c}<\f>{U} {t3} Als sie "
    "schließlich die mentale Kontrolle des Cyber-Bit Beasts vollständig bricht, gewinnt "
    "{C14}Ray{c} den Kampf. <\f>{q}{C13}\"Tut mir so Leid, "
    "{C14}Ray{c}.\"{c}<\f>{u}{Q}{C12}\"{C14}Salima{c}! Das ist alles nur die Schuld der "
    "Psykicks!\" {c}<\f>{U}{q}{C13}\"{C14}Ray{c}... Ich danke dir... für all deine Hilfe...\"{c}",
    "{A9}{a27}{Q}{C12}\"{C14}Salima{c}, réveille-toi!\" {c}<\f>{U}{q}{C13}\"Me réveiller! Je "
    "suis parfaitement réveillée! C'est toi qui es en plein cauchemar!\"{c}<\f>{u}{C14}Salima{c} "
    "résiste au contrôle de son Cyber Bit Beast!<\f>{q}{C13}\"Je ne... peux pas... résister!\" "
    "{c}<\f>{u}{Q}{C12}\"Tu dois le combattre!\"{c}<\f>{U} {t3}Lorsqu'elle finit par vaincre "
    "l'emprise du Cyber Bit Beast, {C14}Ray{c} remporte le match. <\f>{q}{C13}\"Je suis désolée, "
    "{C14}Ray{c}\"{c}<\f>{u}{Q}{C12}\"{C14}Salima{c}! Tu sais que c'était la faute des "
    "Psykicks!\" {c}<\f>{U}{q}{C13}\"{C14}Ray{c}... Merci... de toute ton aide...\"{c}",
    "{A9}{a27}{Q}{C12}\"Svegliati, {C14}Salima{c}!\" {c}<\f>{U}{q}{C13}\"Svegliarmi? Sono "
    "sveglia eccome! Sei tu che stai avendo incubi!\"{c}<\f>{u}{C14}Salima{c} sta resistendo al "
    "controllo del suo Cyber Bit Beast!<\f>{q}{C13}\"Non riesco... a fermarlo...!\" "
    "{c}<\f>{u}{Q}{C12}\"Devi combatterlo!\"{c}<\f>{U} {t3}Mentre {C14}Salima{c} finalmente si "
    "libera dall'influenza del Cyber Bit Beast, {C14}Rey{c} vince l'incontro.<\f>{q}{C13}\"Mi "
    "spiace tanto, {C14}Rey{c}!\"{c}<\f>{u}{Q}{C12}\"{C14}Salima{c}! Sai che tutto questo è "
    "stata colpa della squadra Psykicks!\" {c}<\f>{U}{q}{C13}\"{C14}Rey{c}... grazie... per il "
    "tuo aiuto...\"{c}",
};

static const unk8* _806A6DC[5] = {
    "On the next floor of the building {C14}Kai{c}{A3} must face {C14}Goki{c}{a20}, but "
    "something isn't right... <\f>{Q}{C12}\"It's {C14}Goki{c}... He looks like... just like "
    "Wyatt.\"{c}<\f>{U}Wyatt once asked {C14}Kai{c} to teach him how to blade but {C14}Kai{c} "
    "refused.<\f>As a result, Wyatt followed the wrong path through training, a path which "
    "resulted in a desperate situation for Wyatt.<\f>{C14}Kai{c} feels in some way responsible "
    "for what happened to Wyatt.<\f>{b}{B}{C14}Doctor B{c} knows of {C14}Kai's{c} guilt and has "
    "launched a psychic assault on {C14}Kai's{c} mind making {C14}Goki{c} look to him like the "
    "ghost of {C14}Wyatt{c}...<\f>but hopefully {C14}Kai's{c} guilt will not get in the way of "
    "the battle.",
    "En la siguiente planta del edificio, {C14}Kai{c}{A3} debe enfrentarse a {C14}Goki{c}{a20}, "
    "pero algo no va bien... <\f>{Q}{C12}\"Es {C14}Goki{c}... Se parece a... es igual que "
    "Wyatt.\"{c}<\f>{U}Wyatt pidió una vez a {C14}Kai{c} que le enseñase a manejar la peonza, "
    "pero {C14}Kai{c} se negó y, como resultado, Wyatt siguió el camino equivocado al "
    "entrenarse; un camino que llevó a Wyatt a una situación desesperada.<\f>{C14}Kai{c} se "
    "siente responsable en cierto modo de lo que le ocurrió a Wyatt.<\f>{b}{B}El {C14}Doctor "
    "B{c} conoce el sentimiento de culpa de {C14}Kai{c} y ha lanzado un ataque psíquico contra "
    "su mente, haciendo que {C14}Goki{c} se le parezca al fantasma de {C14}Wyatt{c}... pero "
    "esperemos que la culpa de {C14}Kai{c} no se interponga en la batalla.",
    "Auf dem nächsten Level wird {C14}Kai{c}{A3} mit {C14}Goki{c}{a20} konfrontiert, aber "
    "irgendetwas stimmt nicht... <\f>{Q}{C12}\"Es ist {C14}Goki{c}... Aber er sieht aus... wie "
    "Wyatt!\"{c}<\f>{U}Wyatt hatte {C14}Kai{c} früher einmal gebeten, ihm das Bladen "
    "beizubringen, aber {C14}Kai{c} hatte abgelehnt. Danach hat Wyatt beim Training einen "
    "falschen Weg eingeschlagen und sich damit in eine verzweifelte Lage "
    "gebracht.<\f>{C14}Kai{c} fühlt sich seitdem irgendwie verantwortlich für das, was mit Wyatt "
    "geschehen ist.<\f>{b}{B}{C14}Doctor B{c} kennt {C14}Kais{c} Gewissensbisse und hat deswegen "
    "einen Psycho-Angriff auf {C14}Kais{c} Verstand gestartet, indem er {C14}Goki{c} aussehen "
    "lässt wie {C14}Wyatt{c}... Aber {C14}Kai{c} wird sich hoffentlich nicht durch seine "
    "Schuldgefühle ablenken lassen.",
    "Au niveau suivant du bâtiment, {C14}Kai{c}{A3} doit affronter {C14}Goki{c}{a20}, mais "
    "quelque chose est bizarre... <\f>{Q}{C12}\"C'est {C14}Goki{c}... Il ressemble... à "
    "Wyatt.\"{c}<\f>{U}Wyatt avait demandé à {C14}Kai{c} de lui apprendre les secrets du blade, "
    "mais {C14}Kai{c} avait refusé. Wyatt avait alors suivi une mauvaise voie d'entraînement, "
    "une voie qui s'était révélée désastreuse pour Wyatt.<\f>{C14}Kai{c} se sent un peu "
    "responsable de ce qui est arrivé à Wyatt.<\f>{b}{B}Le {C14}docteur B{c} est au courant du "
    "sentiment de culpabilité de {C14}Kai{c} et a lancé une attaque psychique contre lui afin de "
    "faire ressembler {C14}Goki{c} au fantôme de {C14}Wyatt{c}... Espérons que le sentiment de "
    "culpabilité de {C14}Kai{c} ne va pas le gêner durant le combat.",
    "Al piano seguente, {C14}Kay{c}{A3} deve affrontare {C14}Goki{c}{a20}, ma c'è qualcosa di "
    "strano...<\f>{Q}{C12}\"È {C14}Goki{c}... ma sembra... sembra Wyatt...\"{c}<\f>{U}Wyatt una "
    "volta aveva chiesto a {C14}Kay{c} di insegnargli a usare i Beyblade, ma {C14}Kay{c} aveva "
    "rifiutato. Per questa ragione, Wyatt aveva scelto il percorso sbagliato durante gli "
    "allenamenti e si è trovato in una situazione disastrosa.<\f>{C14}Kay{c} si sente in qualche "
    "modo responsabile di ciò che è successo a Wyatt.<\f>{b}{B}Il {C14}Dottor B{c}, che conosce "
    "tutta la storia, ha lanciato un assalto psichico contro {C14}Kay{c}, facendogli apparire "
    "{C14}Goki{c} come il fantasma di {C14}Wyatt{c}. Per fortuna, però, il senso di colpa di "
    "{C14}Kay{c} non influenza la battaglia.",
};

static const unk8* _806A6F0[5] = {
    "{A3}{a20}{C14}Kai{c} can't shake it from his mind that he is fighting Wyatt. Eventually he "
    "decides to use his respect for Wyatt to win against {C14}Goki{c}.<\f>{t2}{Q}{C12}\"Watch "
    "me, Wyatt. Watch me Beyblade for you... This is your battle. \"{c}<\f>{U}In the final "
    "decisive move, {C14}Kai{c} uses Dranzer's Flame Saber attack...<\f>{t3}{Q}{C12}\"Wyatt was "
    "a brave blader... Dranzer... Attaaack!!!{f4}\" {c}<\f>{U}{a10}{C12}\"Way to go, "
    "{C14}Kai{c}... Bring on the next level!\"{c}",
    "{A3}{a20}{C14}Kai{c} no puede quitarse de la cabeza que está peleando con Wyatt; finalmente "
    "decide usar su respeto por Wyatt para vencer a {C14}Goki{c}.<\f>{t2}{Q}{C12}\"Mírame, "
    "Wyatt... Mírame manejar la Peonza para ti... Esta es tu batalla\"{c}<\f>{U}En el decisivo "
    "momento final, {C14}Kai{c} usa el ataque Lanzallamas de Dranzer...<\f>{t3}{Q}{C12}\"Wyatt "
    "era un Blader valiente... Dranzer... ¡¡¡Ataaaca!!!{f4}\" {c}<\f>{U}{a10}{C12}\"Bien hecho, "
    "Kai... {C14}Kai{c}... ¡A por el siguiente nivel!\"{c}",
    "{A3}{a20}{C14}Kai{c} ist immer noch irritiert von der Vorstellung, gegen Wyatt zu kämpfen. "
    "Aber dann beschließt er, seinen Respekt für Wyatt zu nutzen, um {C14}Goki{c} zu "
    "schlagen.<\f>{t2}{Q}{C12}\"Schau her, Wyatt... Dieser Beyblade-Kampf ist für dich... Dies "
    "ist dein Kampf!\"{c}<\f>{U}Schließlich setzt {C14}Kai{c} Dranzers Flame Sabre-Attacke "
    "ein...<\f>{t3}{Q}{C12}\"Wyatt war ein stolzer Blader... Dranzer... Attaaacke!!!{f4}\" "
    "{c}<\f>{U}{a10}{C12}\"Gut gemacht, {C14}Kai{c}... Auf zum nächsten Level!\"{c}",
    "{A3}{a20}{C14}Kai{c} ne peut s'empêcher de penser qu'il affronte Wyatt. "
    "Il finit par décider d'utiliser le respect qu'il éprouve pour Wyatt afin "
    "de gagner contre {C14}Goki{c}.<\f>{t2}{Q}{C12}\"Regarde-moi, Wyatt... "
    "Regarde-moi combattre pour toi... C'est ton combat.\"{c}<\f>{U}Lors du "
    "dernier mouvement décisif, {C14}Kai{c} utilise l'attaque Sabre de feu de "
    "Dranzer...<\f>{t3}{Q}{C12}\"Wyatt était un blader courageux... "
    "Dranzer... A l'attaque!{f4}\" {c}<\f>{U}{a10}{C12}\"Bravo, "
    "{C14}Kai{c}... On passe au niveau suivant!\"{c}",
    "{A3}{a20}{C14}Kay{c} non riesce a togliersi dalla mente l'idea di battersi contro Wyatt, "
    "così decide di sfruttare il rispetto che nutre nei suoi confronti per vincere contro "
    "{C14}Goki{c}.<\f>{t2}{Q}{C12}\"Guardami, Wyatt... Guardami mentre mi batto per te col "
    "Beyblade. Questa è la tua battaglia.\"{c}<\f>{U}Nella mossa finale, {C14}Kay{c} usa "
    "l'attacco Energia di fuoco del Dranzer.<\f>{t3}{Q}{C12}\"Wyatt era un bravo Beyblader. "
    "Dranzer... All'attaccooo!{f4}\" {c}<\f>{U}{a10}{C12}\"Bravissimo, {C14}Kay{c}! Passiamo al "
    "piano seguente!\"{c}",
};

static const unk8* _806A704[5] = {
    "The Saint Shields have decided to sneak into {C14}Gideon's{c} building to try and help the "
    "Bladebreakers.<\f>{C14}Ozuma{c} and the others have realized that if the Bladebreakers are "
    "defeated by {C14}Gideon{c} and {C14}Doctor B{c}, the 4 Bit Beasts will be harder to "
    "steal!!<\f>And as the old saying goes, keep your friends close, and your enemies "
    "closer!<\f>They search through {C14}Gideon's{c} Battle Tower looking for {C14}Tyson{c} and "
    "the others but they are proving difficult to find in this maze of corridors!",
    "Los Saint Shields han decidido colarse en el edificio de {C14}Gideon{c} "
    "para intentar ayudar a los Bladebreakers, {C14}Ozuma{c} y el resto se "
    "han dado cuenta de que si los Bladebreakers son derrotados por "
    "{C14}Gideon{c} y el {C14}Doctor B{c} ¡los 4 Bit Beasts serán más "
    "difíciles de robar! Y, como dice el viejo dicho, ten cerca a tus amigos, "
    "¡y más cerca aún a tus enemigos! Investigan desesperadamente en la Torre "
    "de batalla de {C14}Gideon{c}, buscando a {C14}Tyson{c} y a los demás, "
    "pero en este laberinto de pasillos ¡no resulta nada fácil!",
    "Die Saint Shields haben sich entschlossen, in {C14}Gideons{c} Gebäude einzudringen und den "
    "Bladebreakers zu helfen. {C14}Ozuma{c} und die anderen wissen, dass im Falle einer "
    "Niederlage der Bladebreakers gegen {C14}Gideon{c} und {C14}Doctor B{c} die 4 Bit Beasts "
    "noch schwerer zu stehlen sein werden! Aber, um an die Bit Beasts zu kommen, muss man schon "
    "mal ungewöhnliche Wege gehen! In {C14}Gideons{c} Battle Tower suchen sie verzweifelt nach "
    "{C14}Tyson{c} und den anderen, aber das Gewirr der Gänge scheint unüberschaubar!",
    "Les Saint Shields ont décidé de s'infiltrer dans le bâtiment de {C14}Gideon{c} pour tenter "
    "d'aider les Bladebreakers. {C14}Ozuma{c} et les autres ont compris que si les Bladebreakers "
    "sont vaincus par {C14}Gideon{c} et le {C14}docteur B{c}, les 4 Bit Beasts seront plus "
    "difficiles à voler! Et comme le veut le dicton, mieux vaut un ennemi connu qu'un ennemi "
    "dont on ne sait rien! Ils fouillent désespérément la tour de combat de {C14}Gideon{c} à la "
    "recherche de {C14}Tyson{c} et des autres, mais ils sont difficiles à localiser dans ce "
    "dédale de couloirs...",
    "I Saint Seals hanno deciso di entrare di soppiatto nell'edifico di "
    "{C14}Gideon{c} per aiutare i Bladebreakers. {C14}Ozuma{c} e gli altri "
    "hanno capito che, se {C14}Gideon{c} e il {C14}Dottor B{c} sconfiggeranno "
    "i Bladebreakers, i quattro Bit Beast diventeranno più difficili da "
    "rubare. Come dice il vecchio proverbio: 'Stai vicino agli amici e ancora "
    "più vicino ai nemici'. Così, frugano tutta la Torre delle battaglie di "
    "{C14}Gideon{c} alla ricerca di {C14}Takao{c} e degli altri, ma è "
    "difficile trovarli in quel labirinto di corridoi!",
};

static const unk8* _806A718[5] = {
    "{A4}{Q}{C13}\"Psykicks lose again...\" {c}<\f>{U}{a16}{q}{C13}\"{C14}Kane{c}!... Listen to "
    "me... If you remain focused on your Cyber Dragoon... then the next battle is all yours just "
    "for the taking!<\f>{C14}Gideon{c}, please forget our last minor setback! Dragoon is the "
    "most important Bit Beast of them all!\"{c}<\f>{u}{t1}{A19}{Q}{C13}\"Then I suggest you "
    "guarantee me the next victory, {C14}Doctor B{c}...\"{c}<\f>{U}{q}{C13}\"You have my word on "
    "it...\" {c}<\f>{u}{a4}{q}{C13}\"You can count on me, Mr. {C14}Gideon{c}. I'll get you your "
    "precious Dragoon...\"{c}<\f>{u}{A10}{Q}{C12}\"Finally, it's my turn! This is gonna be "
    "sweet!\"{c}",
    "{A4}{Q}{C13}\"Lo Pyskicks vuelven a perder...\" {c}<\f>{U}{a16}{q}{C13}\"¡{C14}Kane{c}!... "
    "Escúchame... Si sigues concentrado en tu Cíber Dragón... ¡la próxima batalla será tuya con "
    "facilidad! ¡{C14}Gideon{c}, por favor, olvida nuestra última pequeña derrota! ¡Dragón es el "
    "Bit Beast más importante de todos!\"{c}<\f>{u}{t1}{A19}{Q}{C13}\"Entonces te sugiero que me "
    "garantices la próxima Victoria, {C14}Doctor B{c}...\"{c}<\f>{U}{q}{C13}\"Tienes mi "
    "palabra...\" {c}<\f>{u}{a4}{q}{C13}\"Puede contar conmigo, Sr. {C14}Gideon{c}. Yo le traeré "
    "su preciado Dragón...\"{c}<\f>{u}{A10}{Q}{C12}\"Por fin, ¡es mi turno! ¡Esto va a ser pan "
    "comido!...\"{c}",
    "{A4}{Q}{C13}\"Team Psykick verliert erneut...\" {c}<\f>{U}{a16}{q}{C13}\"{C14}Kane{c}! Hör "
    "mir zu... Konzentrier dich auf den Cyber-Dragoon... und du kannst den nächsten Kampf nicht "
    "verlieren! {C14}Gideon{c}, vergessen Sie bitte unseren kleinen Rückschlag! Dragoon ist das "
    "wichtigste Bit Beast von allen!\"{c}<\f>{u}{t1}{A19}{Q}{C13}\"Dann schlage ich vor, dass "
    "Sie mir den nächsten Sieg garantieren, {C14}Doctor B{c}...\"{c}<\f>{U}{q}{C13}\"Sie haben "
    "mein Wort darauf...\" {c}<\f>{u}{a4}{q}{C13}\"Sie können auf mich zählen, Mr. "
    "{C14}Gideon{c}. Ich werde Ihnen Dragoon ausliefern...\"{c}<\f>{u}{A10}{Q}{C12}\"Endlich bin "
    "ich dran! Das wird toll!\"{c}",
    "{A4}{Q}{C13}\"Les Pyskicks perdent de nouveau...\" {c}<\f>{U}{a16}{q}{C13}\"{C14}Kane{c}! "
    "Ecoute-moi... Si tu restes concentré sur ton Cyber Dragoon, tu remporteras le prochain "
    "combat! {C14}Gideon{c}, oubliez cet incident de parcours! Dragoon est le plus important de "
    "tous les Bit Beasts!\"{c}<\f>{u}{t1}{A19}{Q}{C13}\"Dans ce cas, je vous invite à m'apporter "
    "la victoire, {C14}docteur B{c}...\"{c}<\f>{U}{q}{C13}\"Je vous en donne ma parole...\" "
    "{c}<\f>{u}{a4}{q}{C13}\" Vous pouvez compter sur moi, M. {C14}Gideon{c}. Je vous apporterai "
    "votre précieux Dragoon...\"{c}<\f>{u}{A10}{Q}{C12}\"Mon tour est enfin arrivé! Ca va être "
    "super!\"{c}",
    "{A4}{Q}{C13}\"La squadra Pyskicks perde ancora...\" {c}<\f>{U}{a16}{q}{C13}\"{C14}Kane{c}! "
    "Ascoltami! Se rimarrai concentrato sul tuo Cyber Dragoon, la prossima battaglia sarà tutta "
    "tua! {C14}Gideon{c}, dimentica la nostra ultima sconfitta marginale. Il Dragoon è il Bit "
    "Beast più importante!\"{c}<\f>{u}{t1}{A19}{Q}{C13}\"Allora, {C14}Dottor B{c}, ti consiglio "
    "di essere sicuro della prossima vittoria...\"{c}<\f>{U}{q}{C13}\"Hai la mia parola.\" "
    "{c}<\f>{u}{a4}{q}{C13}\"Può contare su di me, signor {C14}Gideon{c}. Le prenderò il suo "
    "prezioso Dragoon.\"{c}<\f>{u}{A10}{Q}{C12}\"Finalmente è il mio turno! Sarà una bella "
    "battaglia!\"{c}",
};

static const unk8* _806A72C[5] = {
    "{A16}{Q}{C13}\"Prepare to initiate the Power Grid! Now {C14}Kane{c}{a4} will never run out "
    "of power!\" {c}<\f>{U}{t2}{A10}{Q}{C12}\"Let it Rip{f4}!!\"{c}<\f>{U}{C14}Kane's{c} Cyber "
    "Dragoon, being a copy of {C14}Tyson's{c} Dragoon, can perform every move that {C14}Tyson{c} "
    "knows...<\f>...and with the ability to learn new moves it seems unstoppable...",
    "{A16}{Q}{C13}\"Preparado para iniciar la... ¡Parrilla de alimentación! "
    "¡Ahora {C14}Kane{c}{a4} nunca se quedará sin energía!\" "
    "{c}<\f>{U}{t2}{A10}{Q}{C12}\"¡¡Lanza{f4}!!\"{c}<\f>{U}El Cíber Dragón de "
    "{C14}Kane{c}, al ser una copia del dragón de {C14}Tyson{c}, puede "
    "ejecutar todos los movimientos que {C14}Tyson{c} conoce; además, con su "
    "habilidad de aprender nuevos movimientos, parece imparable...",
    "{A16}{Q}{C13}\"Fertig für den Einsatz des... Energienetzes! Jetzt hat "
    "{C14}Kane{c}{a4} unendlich viel Energie!\" "
    "{c}<\f>{U}{t2}{A10}{Q}{C12}\"Let it rip{f4}!\"{c}<\f>{U}{C14}Kanes{c} "
    "Cyber-Dragoon, eine Kopie von {C14}Tysons{c} Dragoon, beherrscht alle "
    "Bewegungen, die auch {C14}Tyson{c} kennt. Und durch seine erstaunliche "
    "Lernfähigkeit scheint es unaufhaltsam...",
    "{A16}{Q}{C13}\"Préparez-vous à activer la... grille de puissance! "
    "Désormais, {C14}Kane{c}{a4} ne manquera plus jamais d'énergie!\" "
    "{c}<\f>{U}{t2}{A10}{Q}{C12}\"Hyper vitesse {f4}!\"{c}<\f>{U}Le Cyber "
    "Dragoon de {C14}Kane{c}, copie du Dragoon de {C14}Tyson{c}, peut "
    "reproduire tous les mouvements que connaît {C14}Tyson{c}. Capable en "
    "outre d'apprendre de nouveaux mouvements, il semble invincible...",
    "{A16}{Q}{C13}\"Pronti ad attivare la griglia energetica! Ora "
    "{C14}Kane{c}{a4} non rimarrà mai a corto di energia!\" "
    "{c}<\f>{U}{t2}{A10}{Q}{C12}\"3, 2, 1, pronti... "
    "lancio{f4}!\"{c}<\f>{U}Il Cyber Dragoon sembra inarrestabile: essendo "
    "una copia del Dragoon di {C14}Takao{c}, oltre a saper eseguire tutte le "
    "mosse che conosce, ne può imparare di nuove...",
};

static const unk8* _806A740[5] = {
    "{a4}{q}{C13}\"It's not under my control?!\" {c}<\f>{u}{A5}{Q}{C12}\"What's going on?\" "
    "{c}<\f>{U}{a15}{q}{C12}\"Bad news, Chief! That Cyber Bit Beast has got a mind of its own "
    "now!\" {c}<\f>{u}{A16}{a23}{Q}{C13}\"I don't remember this being part of the Cyber Bit "
    "Beast's programming! What's going on?\" {c}<\f>{U}{q}{C13}\"Uh, I'm not sure Doctor... The "
    "whole BeyStadium is being flooded with an unusually high amount of energy waves!\" "
    "{c}<\f>{u}{Q}{C13}\"Well do something! Fix it immediately! This doesn't look good.\" "
    "{c}<\f>{U}{t1}{a19}{q}{C13}\"For your sake this had better be just a technical "
    "glitch.\"{c}<\f>{u}{Q}{C13}\"Yes... Of course.\" {c}<\f>{U}{b}{B}Cyber Dragoon becomes so "
    "powerful that it completely takes over {C14}Kane{c}{a4}'s mind... <\f>{q}{C13}\"You're very "
    "lucky, {C14}Tyson{c}, you're about to see what happens when the strongest Blader and the "
    "strongest Bit Beast come together.\" {c}<\f>{u}The Cyber Bit Beast has somehow managed to "
    "take control of the battle room and all the other rooms in this entire facility. "
    "<\f>{C14}Tyson{c}{A10} is looking beaten, but with inspiring words from the other "
    "Bladebreakers...<\f>he manages to muster all his strength and focuses it in to one final "
    "attack for Dragoon.<\f>{Q}{C12}\"Draaaagoon, attaaaack nowwwww{f10}!!!\" "
    "{c}<\f>{U}{t3}{a0}{q}{C12}\"{C14}Tyson{c} did it...\"{c}<\f>{u}{a6}{q}{C12}\"Way to go, "
    "buddy!!\" {c}<\f>{u}{a5}{q}{C12}\"Yeah {C14}Tyson{c}!.. I knew you could do it all along if "
    "you just concentrated!... You blew that Cyber Bit Beast to smithereens!!\"{c}",
    "{a4}{q}{C13}\"¡No me responde!\" {c}<\f>{u}{A5}{Q}{C12}\"¿Qué está pasando?\" "
    "{c}<\f>{U}{a15}{q}{C12}\"¡Malas noticias, jefe! ¡Ahora ese Cíber Bit Beast está pensando "
    "por su cuenta!\" {c}<\f>{u}{A16}{a23}{Q}{C13}\"No recuerdo que esto fuera parte de la "
    "programación de los Cíber Bit Beasts! ¿Qué ocurre?\" {c}<\f>{U}{q}{C13}\"Mmm... no estoy "
    "seguro, Doctor... ¡Todo el Beystadium está siendo inundado por una cantidad inusualmente "
    "elevada de ondas de energía!\" {c}<\f>{u}{Q}{C13}\"¡Pues haz algo! ¡Arréglalo "
    "inmediatamente! Esto no tiene buena pinta.\" {c}<\f>{U}{t1}{a19}{q}{C13}\"Por tu bien, "
    "espero que esto no sea más que un detalle técnico.\"{c}<\f>{u}{Q}{C13}\"Sí... Claro\" "
    "{c}<\f>{U}{b}{B}Cíber Dragón se hace tan poderoso que se adueña por completo de la mente de "
    "{C14}Kane{c}{a4}... <\f>{q}{C13}\"Tienes mucha suerte, {C14}Tyson{c}; estás a punto de ver "
    "qué ocurre cuando el Blader más fuerte se une al Bit Beast más poderoso.\" {c}<\f>{u}El "
    "Cyber Bit Beast se las ha arreglado para hacerse con el control de la sala de batalla, así "
    "como del resto de habitaciones de todo el complejo. <\f>{C14}Tyson{c}{A10} parece "
    "derrotado, pero con palabras de aliento de los otros Bladebreakers, consigue reunir todas "
    "sus fuerzas y concentrarlas en un ataque definitivo para "
    "Dragón.<\f>{Q}{C12}\"Ataaaaaaaaqueeeeeeeeeee Draaaa-gón ahoraaaaaaaaaa{f10}!!!\" "
    "{c}<\f>{U}{t3}{a0}{q}{C12}\"{C14}Tyson{c} lo ha "
    "conseguido...\"{c}<\f>{u}{a6}{q}{C12}\"¡¡Muy bien, colega!!\" {c}<\f>{u}{a5}{q}{C12}\"¡Sí, "
    "{C14}Tyson{c}!.. ¡Sabía desde el principio que lo conseguirías si te concentrabas!... "
    "¡Hiciste añicos a ese Cíber Bit Beast!\"{c}",
    "{a4}{q}{C13}\"Ich habe keine Kontrolle?!\" {c}<\f>{u}{A5}{Q}{C12}\"Was geht hier vor?\" "
    "{c}<\f>{U}{a15}{q}{C12}\"Schlechte Neuigkeiten, Boss! Das Cyber-Bit Beast hat jetzt einen "
    "eigenständigen Willen!\" {c}<\f>{u}{A16}{a23}{Q}{C13}\"Das ist doch nicht Teil des "
    "Cyber-Bit Beast-Programms! Was ist hier los?\" {c}<\f>{U}{q}{C13}\"Öh, bin mir nicht "
    "sicher, Doctor... Die ganze Bey-Arena scheint mit einer außergewöhnlich großen Menge an "
    "Energiewellen geflutet zu sein!\" {c}<\f>{u}{Q}{C13}\"Dann tu etwas dagegen! Das können wir "
    "jetzt wirklich nicht gebrauchen.\" {c}<\f>{U}{t1}{a19}{q}{C13}\"Ich hoffe für Sie, dass "
    "dies nur eine kleine technische Panne ist.\"{c}<\f>{u}{Q}{C13}\"Ja... natürlich.\" "
    "{c}<\f>{U}{b}{B}Der Cyber-Dragoon wird so mächtig, dass er vollständig die mentale "
    "Kontrolle über {C14}Kane{c}{a4} übernimmt... <\f>{q}{C13}\"Du darfst dich glücklich "
    "schätzen, {C14}Tyson{c}. Gleich wirst du sehen, was passiert, wenn der stärkste Blader und "
    "das stärkste Bit Beast zusammen arbeiten.\" {c}<\f>{u}Das Cyber-Bit Beast hat irgendwie die "
    "Kontrolle über den Kampfraum und alle anderen Räume der gesamten Einrichtung übernommen. "
    "<\f>{C14}Tyson{c}{A10} ist fast geschlagen, aber - angefeuert von den anderen Bladebreakers "
    "- konzentriert er sich auf einen letzten und entscheidenden Schlag seines "
    "Dragoons.<\f>{Q}{C12}\"Draaaa-goon! Attaaaaackeeee! Jeeeeeetzt{f10}!!!\" "
    "{c}<\f>{U}{t3}{a0}{q}{C12}\"{C14}Tyson{c} hat's geschafft...\"{c}<\f>{u}{a6}{q}{C12}\"Gut "
    "gemacht, Kumpel!\" {c}<\f>{u}{a5}{q}{C12}\"Yeah, {C14}Tyson{c}! Ich wusste, du kannst es "
    "schaffen, wenn du dich nur konzentrierst! Du hast dieses Cyber-Bit Beast in Stücke "
    "zerfetzt!\"{c}",
    "{a4}{q}{C13}\"Il n'est pas sous mon contrôle?!\" {c}<\f>{u}{A5}{Q}{C12}\"Qu'est-ce qui se "
    "passe?\" {c}<\f>{U}{a15}{q}{C12}\"Mauvaise nouvelle, chef! Ce Cyber Bit Beast possède "
    "maintenant son propre esprit!\" {c}<\f>{u}{A16}{a23}{Q}{C13}\"Je n'ai pas souvenir que cela "
    "faisait partie de la programmation du Cyber Bit Beast! Mais que se passe-t-il?\" "
    "{c}<\f>{U}{q}{C13}\"Euh, je n'en sais rien, docteur... Tout le stade est inondé d'un raz de "
    "marée d'ondes énergétiques!\" {c}<\f>{u}{Q}{C13}\"Eh bien, faites quelque chose! Réglez "
    "cela immédiatement! Quelque chose ne va pas!\" {c}<\f>{U}{t1}{a19}{q}{C13}\"Il vaudrait "
    "mieux pour vous qu'il ne s'agisse que d'un petit ennui "
    "technique.\"{c}<\f>{u}{Q}{C13}\"Oui... Bien entendu...\" {c}<\f>{U}{b}{B}Cyber Dragoon "
    "devient tellement puissant qu'il s'empare complètement de l'esprit de {C14}Kane{c}{a4}... "
    "<\f>{q}{C13}\"Tu as beaucoup de chance, {C14}Tyson{c}... Tu vas pouvoir voir ce qui se "
    "passe lorsque le meilleur blader et le Bit Beast le plus puissant fusionnent.\" "
    "{c}<\f>{u}Le Cyber Bit Beast est parvenu à prendre le contrôle de la salle du combat et de "
    "toutes les autres pièces du site.<\f>{C14}Tyson{c}{A10} semble battu, mais les "
    "encouragements des autres Bladebreakers l'aident à rassembler ses forces et à se concentrer "
    "sur une dernière attaque de Dragoon.<\f>{Q}{C12}\"Draaaa-goon... Atttttaaaaque "
    "maaaintenaaant {f10}!\" {c}<\f>{U}{t3}{a0}{q}{C12}\"{C14}Tyson{c} a "
    "réussi...\"{c}<\f>{u}{a6}{q}{C12}\"Bravo, mec!\" {c}<\f>{u}{a5}{q}{C12}\"Ouais, "
    "{C14}Tyson{c}! J'ai toujours su que tu pouvais y arriver si tu restais concentré! Tu as "
    "réduit en miettes ce Cyber Bit Beast!\"{c}",
    "{a4}{q}{C13}\"Non è sotto il mio controllo?\" {c}<\f>{u}{A5}{Q}{C12}\"Che succede?\" "
    "{c}<\f>{U}{a15}{q}{C12}\"Pessime notizie, capo! Quel Cyber Bit Beast ora ha una volontà "
    "propria!\" {c}<\f>{u}{A16}{a23}{Q}{C13}\"Non mi pare che facesse parte del suo programma! "
    "Che sta succedendo?\" {c}<\f>{U}{q}{C13}\"Uh, Dottore, non sono sicuro... l'intero stadio "
    "Beyblade sembra colpito da una quantità insolitamente alta di onde energetiche!\" "
    "{c}<\f>{u}{Q}{C13}\"Ebbene, fate qualcosa! Rimediate subito! Questa cosa non mi piace.\" "
    "{c}<\f>{U}{t1}{a19}{q}{C13}\"Per il tuo bene, è meglio che sia soltanto un lieve "
    "inconveniente tecnico.\"{c}<\f>{u}{Q}{C13}\"Sì... naturalmente.\" {c}<\f>{U}{b}{B}Il Cyber "
    "Dragoon diventa così potente da controllare del tutto la mente di "
    "{C14}Kane{c}{a4}.<\f>{q}{C13}\"Sei stato molto fortunato, {C14}Takao{c}. Stai per scoprire "
    "che cosa succederà quando il miglior Beyblader e il più potente Bit Beast uniscono le loro "
    "forze.\" {c}<\f>{u}Chissà come, il Cyber Bit Beast è riuscito ad assumere il controllo di "
    "tutte le stanze dell'intero edificio.<\f>{C14}Takao{c}{A10} sembra sconfitto, ma grazie "
    "alle fervide invocazioni degli altri, Bladebreakers riesce a concentrare tutte le sue forze "
    "per concentrarsi sull'attacco finale con il Dragoon.<\f>{Q}{C12}\"Draaaa-goon "
    "All'attaccoooooooo! Oraaaa!{f10}!!!\" {c}<\f>{U}{t3}{a0}{q}{C12}\"{C14}Takao{c} ce l'ha "
    "fatta...\"{c}<\f>{u}{a6}{q}{C12}\"Fantastico, amico!\" {c}<\f>{u}{a5}{q}{C12}\"Sì, "
    "{C14}Takao{c}! Sapevo che avresti potuto farcela se ti fossi concentrato! Hai fatto a pezzi "
    "quel Cyber Bit Beast!\"{c}",
};

static const unk8* _806A754[5] = {
    "{A16}{Q}{C13}\"He just destroyed my precious Cyber Dragoon... "
    "\"{c}<\f>{U}{t1}{a19}{q}{C13}\"But how?!...\" {c}<\f>{u}{b}{B}The floor of the Battle Tower "
    "is starting to shake violently...<\f>{t3}{A10}{Q}{C12}\"What's goin' on here!?...\" "
    "{c}<\f>{U}{a5}{q}{C12}\"I'm not sure, {C14}Tyson{c}! I think we better ask Dizzi!!\" "
    "{c}<\f>{u}{b}{B}{A15}{Q}{C12}\"Cyber Dragoon's energy destroyed the integrity of this "
    "structure!!\" {c}<\f>{U}{A10}{a5}{Q}{C12}\"Ya mind sayin' that in "
    "English!?\"{c}<\f>{U}{q}{C12}\"I think she means this whole building's about to collapse!\" "
    "{c}",
    "{A16}{Q}{C13}\"Acaba de destruir mi preciado Cíber Dragón... "
    "\"{c}<\f>{U}{t1}{a19}{q}{C13}\"¡¿Pero cómo?!...\" {c}<\f>{u}{b}{B}El suelo de la torre de "
    "batalla está empezando a temblar violentamente...<\f>{t3}{A10}{Q}{C12}\"¡¿Qué está pasando "
    "aquí?!...\" {c}<\f>{U}{a5}{q}{C12}\"¡No estoy seguro, {C14}Tyson{c}! ¡¡Creo que será mejor "
    "que preguntemos a Dizzi!!\" {c}<\f>{u}{b}{B}{A15}{Q}{C12}\"¡¡La energía del Cíber Dragón ha "
    "dañado la integridad de esta estructura!!\" {c}<\f>{U}{A10}{a5}{Q}{C12}\"¿Te importaría "
    "hablar en cristiano?\"{c}<\f>{U}{q}{C12}\"¡Creo que quiere decir que todo el edificio está "
    "a punto de derrumbarse!\" {c}",
    "{A16}{Q}{C13}\"Er hat meinen wertvollen Cyber-Dragoon zerstört... "
    "\"{c}<\f>{U}{t1}{a19}{q}{C13}\"Aber wie?!...\" {c}<\f>{u}{b}{B}Der Boden des Battle Tower "
    "beginnt stark zu beben...<\f>{t3}{A10}{Q}{C12}\"Was geht hier vor!?\" "
    "{c}<\f>{U}{a5}{q}{C12}\"Ich bin mir nicht sicher, {C14}Tyson{c}! Fragen wir besser Dizzi!\" "
    "{c}<\f>{u}{b}{B}{A15}{Q}{C12}\"Die Energie des Cyber-Dragoon hat die Statik dieser Struktur "
    "erschüttert!\" {c}<\f>{U}{A10}{a5}{Q}{C12}\"Kannst du dich auch deutlicher "
    "ausdrücken!?\"{c}<\f>{U}{q}{C12}\"Ich denke, sie meint, dass das ganze Gebäude gleich "
    "einstürzt!\" {c}",
    "{A16}{Q}{C13}\"Il vient de détruire mon précieux Cyber "
    "Dragoon...\"{c}<\f>{U}{t1}{a19}{q}{C13}\"Mais comment?\" {c}<\f>{u}{b}{B}Le sol de la tour "
    "de combat se met à trembler violemment...<\f>{t3}{A10}{Q}{C12}\"Qu'est-ce qui se passe "
    "ici?\" {c}<\f>{U}{a5}{q}{C12}\"Je ne sais pas trop, {C14}Tyson{c}! Je crois qu'il vaudrait "
    "mieux demander à Dizzi!\" {c}<\f>{u}{b}{B}{A15}{Q}{C12}\"L'énergie de Cyber Dragoon a "
    "détruit l'intégrité de toute la structure!\" {c}<\f>{U}{A10}{a5}{Q}{C12}\"Tu peux me "
    "répéter cela en clair?\"{c}<\f>{U}{q}{C12}\"Je pense qu'elle veut dire que le bâtiment va "
    "s'écrouler!\" {c}",
    "{A16}{Q}{C13}\"Ha appena distrutto il mio prezioso Cyber "
    "Dragoon...\"{c}<\f>{U}{t1}{a19}{q}{C13}\"Ma come?!...\" {c}<\f>{u}{b}{B}Il pavimento della "
    "Torre delle battaglie sta iniziando a tremare violentemente.<\f>{t3}{A10}{Q}{C12}\"Ma che "
    "succede qui?\" {c}<\f>{U}{a5}{q}{C12}\"Non lo so, {C14}Takao{c}! Dobbiamo chiederlo a "
    "Dizzi!\" {c}<\f>{u}{b}{B}{A15}{Q}{C12}\"L'energia del Cyber Dragoon ha distrutto "
    "l'integrità di questa struttura!\" {c}<\f>{U}{A10}{a5}{Q}{C12}\"In altre "
    "parole?\"{c}<\f>{U}{q}{C12}\"Secondo me vuol dire che sta per crollare tutto!\" {c}",
};

static const unk8* _806A768[5] = {
    "{A16}{Q}{C13}\"He just destroyed my precious Cyber "
    "Dragoon!\"{c}<\f>{U}{t1}{a19}{q}{C13}\"But how?!...\" {c}<\f>{u}{b}{B}The floor of the "
    "Battle Tower is starting to shake violently...<\f>{t3}{A10}{Q}{C12}\"What's goin' on "
    "here!?...\" {c}<\f>{U}{a5}{q}{C12}\"I'm not sure, {C14}Tyson{c}! I think we better ask "
    "Dizzi!!\" {c}<\f>{u}{b}{B}{A15}{Q}{C12}\"Cyber Dragoon's energy destroyed the integrity of "
    "this structure!!\" {c}<\f>{U}{A10}{a5}{Q}{C12}\"Ya mind sayin' that in "
    "English!?\"{c}<\f>{U}{q}{C12}\"I think she means this whole building's about to collapse!\" "
    "{c}<\f>{u}{A10}{Q}{C12}\"We gotta get outta here!!\" {c}<\f>{U}As everyone escapes the "
    "building, {C14}Max{c} remembers his trapped Draciel.<\f>He runs into the room where it's "
    "held captive and, with the Saint Shields' help, he manages to free it!<\f>Everyone gets "
    "free of the building just in time as it falls to the ground.<\f>After a beautiful sunrise, "
    "Team Psykick and the Bladebreakers go their separate ways... <\f>{t3}{a4}{q}{C13}\"Hey "
    "{C14}Tyson{c}, thanks... I'll always remember this...\"{c}",
    "{A16}{Q}{C13}\"Acaba de destruir mi preciado Cíber Dragón... "
    "\"{c}<\f>{U}{t1}{a19}{q}{C13}\"¡¿Pero cómo?!...\" {c}<\f>{u}{b}{B}El suelo de la torre de "
    "batalla está empezando a temblar violentamente...<\f>{t3}{A10}{Q}{C12}\"¡¿Qué está pasando "
    "aquí?!...\" {c}<\f>{U}{a5}{q}{C12}\"¡No estoy seguro, {C14}Tyson{c}! ¡¡Creo que será mejor "
    "que preguntemos a Dizzi!!\" {c}<\f>{u}{b}{B}{A15}{Q}{C12}\"¡¡La energía del Cíber Dragón ha "
    "dañado la integridad de esta estructura!!\" {c}<\f>{U}{A10}{a5}{Q}{C12}\"¿Te importaría "
    "hablar en cristiano?\"{c}<\f>{U}{q}{C12}\"¡Creo que quiere decir que todo el edificio está "
    "a punto de derrumbarse!\" {c}<\f>{u}{A10}{Q}{C12}\"¡¡Tenemos que salir de aquí!!\" "
    "{c}<\f>{U}Mientras todos huyen del edificio, {C14}Max{c} se acuerda de su Draciel atrapado, "
    "corre a la habitación en la que se encuentra prisionero y, con ayuda de los Saint Shields, "
    "¡consigue liberarlo! Todos consiguen salir del edificio justo en el momento en el que se "
    "derrumba. Tras un bello amanecer, el equipo Psykick y los Bladebreakers se van cada uno por "
    "su camino.<\f>{t3}{a4}{q}{C13}\"Ey {C14}Tyson{c}, gracias... Siempre lo recordaré...\"{c}",
    "{A16}{Q}{C13}\"Er hat meinen wertvollen Cyber-Dragoon zerstört... "
    "\"{c}<\f>{U}{t1}{a19}{q}{C13}\"Aber wie?!...\" {c}<\f>{u}{b}{B}Der Boden des Battle Tower "
    "beginnt stark zu beben...<\f>{t3}{A10}{Q}{C12}\"Was geht hier vor!?\" "
    "{c}<\f>{U}{a5}{q}{C12}\"Ich bin mir nicht sicher, {C14}Tyson{c}! Fragen wir besser Dizzi!\" "
    "{c}<\f>{u}{b}{B}{A15}{Q}{C12}\"Die Energie des Cyber-Dragoon hat die Statik dieser Struktur "
    "erschüttert!\" {c}<\f>{U}{A10}{a5}{Q}{C12}\"Kannst du dich auch deutlicher "
    "ausdrücken!?\"{c}<\f>{U}{q}{C12}\"Ich denke, sie meint, dass das ganze Gebäude gleich "
    "einstürzt!\" {c}<\f>{u}{A10}{Q}{C12}\"Wir müssen hier raus!\" {c}<\f>{U}Auf dem Weg nach "
    "draußen erinnert sich {C14}Max{c} an seinen Draciel, läuft in den Raum, in dem er gefangen "
    "ist, und kann ihn mit Hilfe der Saint Shields befreien! Alle entkommen rechtzeitig aus dem "
    "Gebäude, bevor es zusammenbricht. Nach einem wundervollen Sonnenaufgang trennen sich das "
    "Team Psykick und die Bladebreakers und gehen ihrer Wege. <\f>{t3}{a4}{q}{C13}\"Hey, "
    "{C14}Tyson{c}. Danke... Das werde ich nicht vergessen...\"{c}",
    "{A16}{Q}{C13}\"Il vient de détruire mon précieux Cyber "
    "Dragoon...\"{c}<\f>{U}{t1}{a19}{q}{C13}\"Mais comment?\" {c}<\f>{u}{b}{B}Le sol de la tour "
    "de combat se met à trembler violemment...<\f>{t3}{A10}{Q}{C12}\"Qu'est-ce qui se passe "
    "ici?\" {c}<\f>{U}{a5}{q}{C12}\"Je ne sais pas trop, {C14}Tyson{c}! Je crois qu'il vaudrait "
    "mieux demander à Dizzi!\" {c}<\f>{u}{b}{B}{A15}{Q}{C12}\"L'énergie de Cyber Dragoon a "
    "détruit l'intégrité de toute la structure!\" {c}<\f>{U}{A10}{a5}{Q}{C12}\"Tu peux me "
    "répéter cela en clair?\"{c}<\f>{U}{q}{C12}\"Je pense qu'elle veut dire que le bâtiment va "
    "s'écrouler!\" {c}<\f>{u}{A10}{Q}{C12}\"Il faut filer d'ici!\" {c}<\f>{U}Tandis que tout le "
    "monde fuit le bâtiment, {C14}Max{c} se rappelle que son Draciel est pris au piège. Il court "
    "vers la salle où il est retenu et, avec l'aide des Saint Shields, parvient à le libérer! "
    "Tout le monde quitte le bâtiment au moment où il s'effondre. Après un magnifique lever de "
    "soleil, l'équipe Psykick et les Bladebreakers se séparent. <\f>{t3}{a4}{q}{C13}\"Eh, "
    "{C14}Tyson{c}! Merci... je n'oublierai jamais ce que tu as fait...\"{c}",
    "{A16}{Q}{C13}\"Ha appena distrutto il mio prezioso Cyber "
    "Dragoon...\"{c}<\f>{U}{t1}{a19}{q}{C13}\"Ma come?!...\" {c}<\f>{u}{b}{B}Il pavimento della "
    "Torre delle battaglie sta iniziando a tremare violentemente.<\f>{t3}{A10}{Q}{C12}\"Ma che "
    "succede qui?\" {c}<\f>{U}{a5}{q}{C12}\"Non lo so, {C14}Takao{c}! Dobbiamo chiederlo a "
    "Dizzi!\" {c}<\f>{u}{b}{B}{A15}{Q}{C12}\"L'energia del Cyber Dragoon ha distrutto "
    "l'integrità di questa struttura!\" {c}<\f>{U}{A10}{a5}{Q}{C12}\"In altre "
    "parole?\"{c}<\f>{U}{q}{C12}\"Secondo me vuol dire che sta per crollare tutto!\" "
    "{c}<\f>{u}{A10}{Q}{C12}\"Dobbiamo uscire di qui!\" {c}<\f>{U}Mentre tutti fuggono "
    "dall'edificio, {C14}Max{c} si ricorda del suo Draciel intrappolato e raggiunge di corsa la "
    "stanza dove è tenuto prigioniero. Con l'aiuto dei Saint Seals riesce a liberarlo! Tutti "
    "riescono ad abbandonare l'edificio poco prima che crolli. Dopo uno stupendo tramonto, la "
    "squadra Psykicks e i Bladebreakers si allontanano, ciascuno per la propria "
    "strada.<\f>{t3}{a4}{q}{C13}\"Ehi, {C14}Takao{c}, grazie! Ricorderò sempre questa "
    "avventura.\"{c}",
};

const unk8** _806A77C[] = {
    _806A434,
    _806A448,
    _806A45C,
    _806A470,
    _806A484,
    _806A498,
    _806A4AC,
    _806A4C0,
    _806A4D4,
    _806A4E8,
    _806A4FC,
    _806A510,
    _806A524,
    _806A538,
    _806A54C,
    _806A560,
    _806A574,
    _806A588,
    _806A59C,
    _806A5B0,
    _806A5C4,
    _806A5D8,
    _806A5EC,
    _806A600,
    _806A614,
    _806A628,
    _806A63C,
    _806A650,
    _806A664,
    _806A678,
    _806A68C,
    _806A6A0,
    _806A6B4,
    _806A6C8,
    _806A6DC,
    _806A6F0,
    _806A704,
    _806A718,
    _806A72C,
    _806A740,
    _806A754,
    _806A768,
};

unk32 _806A824 = 0x15;

unk32 sub_8048F80(unk8* string)
{
    unk32 result;
    unk8 digit;

    result = -1;
    digit = *string - '0';
    if (digit > 9) {
        return result;
    }
    result = 0;
    while (digit <= 9) {
        result *= 10;
        result += *string - '0';
        string++;
        digit = *string - '0';
    }
    return result;
}

unk8* sub_8048FB4(unk8* string)
{
    while (*string != '}') {
        string++;
    }
    return string + 1;
}

void nullsub_38(void)
{
}

void nullsub_33(FrontendState* state, unk32 arg1)
{
}

FrontendState* sub_8048FCC(void)
{
    return &_unk3000650;
}

void sub_8048FD4(unk32 arg0)
{
    _unk3000650.transition.unk5A8 = arg0;
}

void sub_8048FE4(void)
{
    sub_804AF5C();
    sub_804AE8C();
    sub_80490F8(-1);
}

unk8 sub_8048FFC(void)
{
    UnkStruct_sub1* transition;

    transition = &_unk3000650.transition.unk590;
    if ((transition->var0C[1].var64 & 1) != 0) {
        return 1;
    }
    return 0;
}

void sub_8049018(void)
{
    _unk3000650.unk84 = _unk3000650.unk88 = -65536;
    _unk3000650.unk8C = _unk3000650.unk90 = -65536;
}

void sub_804903C(BGLayer* object, unk32 arg1, unk32 arg2)
{
    _unk3000650.unk8C = arg1 << 8;
    _unk3000650.unk90 = arg2 << 8;
    _unk3000650.unk84 = object->field_48 << 8;
    _unk3000650.unk88 = object->field_4A << 8;
}

void sub_8049074(BGLayer* object)
{
    _unk3000650.unk84 += sub_80491E0(_unk3000650.unk8C - _unk3000650.unk84, 0x80) << 5;
    _unk3000650.unk88 += sub_80491E0(_unk3000650.unk90 - _unk3000650.unk88, 0x80) << 5;
    object->field_48 = _unk3000650.unk84 >> 8;
    object->field_4A = _unk3000650.unk88 >> 8;
}

void sub_80490CC(unk32 arg0, unk32 arg1)
{
    if (_unk3000650.unkB4 != NULL && _unk3000650.unkB4->unk8 != NULL) {
        _unk3000650.unkB4->unk8(&_unk3000650, arg0, arg1);
    }
}

void sub_80490F8(FrontendStateId arg0)
{
    if (_unk3000650.unk0 != arg0 && _unk3000650.unk4 != arg0) {
        if (_unk3000650.unk0 != -1) {
            sub_8049344(3);
            sub_80490CC(3, 1);
            _unk3000BFC = 1;
        }
        if (_unk3000650.unk7C <= 14) {
            _unk3000650.history[_unk3000650.unk7C++] = _unk3000650.unk4;
            _unk3000650.unk8 = _unk3000650.unk0;
        }
        _unk3000650.unk4 = arg0;
        sub_80495C4();
    }
}

FrontendStateId sub_804915C(void)
{
    return _unk3000650.unk8;
}

void sub_8049168(void)
{
    _unk3000650.unk7C = 0;
}

void sub_8049178(void)
{
    if (_unk3000650.unk7C != 0) {
        sub_8049344(3);
        sub_80490CC(3, 1);
        _unk3000BFC = 1;
        _unk3000650.unk4 = _unk3000650.history[--_unk3000650.unk7C];
        _unk3000650.unk8 = _unk3000650.unk0;
    }
    sub_80495C4();
}

void sub_80491C4(unk32 arg0, unk32 arg1, SpriteTextCleanup* text)
{
    text->unk8 |= 8;
    sub_8061684(text, 0x140, 0x120);
}

s32 sub_80491E0(unk32 arg0, s32 arg1)
{
    s32 value;
    unk32 negative;

    value = arg0;
    negative = (unk32)value >> 31;
    if (value != 0) {
        if (negative != 0) {
            value = 0 - value;
        }
        while (arg1 != 0) {
            if (value > (arg1 << 8)) {
                value = arg1;
                break;
            }
            arg1 >>= 1;
        }
        if (arg1 == 0) {
            value = 1;
        }
        if (negative != 0) {
            value = 0 - value;
        }
    }
    return value;
}

void sub_8049210(unk32 arg0)
{
    if (arg0 >= _unk3000650.unkB4->unk4->unk1C) {
        arg0 = _unk3000650.unkB4->unk4->unk1C - 1;
    }
    _unk3000650.unk7D = arg0 + 1;
}

void sub_8049234(FrontendStateId arg0)
{
    _unk3000650.unkC = arg0;
}

FrontendStateId sub_8049240(void)
{
    return _unk3000650.unkC;
}

void sub_804924C(FrontendStateId arg0)
{
    _unk3000650.unk10 = arg0;
}

FrontendStateId sub_8049258(void)
{
    return _unk3000650.unk10;
}

void sub_8049264(void)
{
    _gameData->unkC26 = -1;
    _unk3000650.unk4 = STATE_NINTENDO;
    _unk3000650.unkC = STATE_NINTENDO;
    sub_804924C(STATE_7);
    _unk3000650.unk0 = -1;
    _unk3000650.unk8 = -1;
    _unk3000650.unk7C = 0;
    sub_8050384(&_unk3000650.motion);
    _unk3000650.unk424 = 0;
    _unk3000650.unk470 = 0;
    _unk3000650.unk474 = 0;
    _unk3000650.menuState.unk9 = 0;
    _unk3000650.unk578 = _unk3000650.unk57C = _unk3000650.unk580 = 0;
    _unk3000650.unk80 = 0;
    _unk3000650.unk7F = 0;
    _unk3000650.transition.value = 0;
    _unk3000650.transition.unk585 = 0;
    _unk3000650.transition.unk586 = 0;
    _unk3000650.transition.unk588 = 0;
    _unk3000650.transition.unk58C = 0;
    _unk3000650.unk81 = 0;
    _unk3000650.transition.unk5A8 = 0;
}

void StoreFunction(FrontendStateCallback function)
{
    _unk3000650.transition.unk588 = function;
}

void sub_8049330(void (*arg0)(void))
{
    _unk3000650.transition.unk58C = arg0;
}

void sub_8049344(u32 arg0)
{
    FrontendState* base0;
    FrontendState* base;
    void (*callback)(FrontendState*, unk32);
    void (*stored)(FrontendState*, unk32);

    callback = NULL;
    base0 = &_unk3000650;
    stored = base0->transition.unk588;
    base = base0;
    if (stored != NULL) {
        callback = stored;
    } else if (arg0 <= 4) {
        switch (arg0) {
        case 0:
        case 2:
            callback = base->unkB4->unk10;
            break;
        case 3:
            callback = base->unkB4->unk14;
            break;
        case 1:
        case 4:
            if (base->transition.unk585 > 0) {
                callback = base->unkB4->unk14;
            } else if (base->transition.unk585 < 0) {
                callback = base->unkB4->unk10;
            }
            break;
        }
    }
    if (callback != NULL) {
        callback(base, arg0);
    }
}

unk32 sub_80493C8(void)
{
    unk32 result;
    FrontendState* state;
    GameData* data;

    result = 0;
    state = &_unk3000650;
    if (state->unk7F != 0 && sub_805FFE4() != 0 && state->transition.value != 0x40) {
        data = _gameData;
        if (data->unk1619 != 1) {
            if (sub_806014C(&data->unk15D4[0], &data->unk15C4, 1) == 0 && sub_806008C() != 0) {
                _gameData->unk1618 = 0;
                _gameData->unk1619 = 1;
                state->unk7F = 0;
                sub_80490F8(STATE_29);
            } else {
                result = 1;
            }
        }
    }
    return result;
}

void sub_8049458(void)
{
    unk32 count;
    FrontendState* state;
    const FrontendObject** object;

    count = 0;
    sub_8049018();
    VBlankIntrWait();
    sub_804A280(&_unk3000650);
    sub_80627F0();
    _unk3000BFC = 1;
    _unk3000BFD = 0;
    sub_8049168();
    sub_80490F8(_unk3000650.unkC);
    while (_unk3000650.unk0 != -1 || _unk3000650.unk4 != -1) {
        VBlankIntrWait();
        updateKeyState();
        sub_804A280(&_unk3000650);
        sub_80627F0();
        sub_80493C8();
        sub_80490CC(1, _unk3000BFC);
        __oam_8756CC0();
        if (_unk3000650.unk0 != _unk3000650.unk4
            && _unk3000650.transition.value == _unk3000650.transition.unk586) {
            count = 0;
            sub_804967C();
        }
        state = &_unk3000650;
        object = &state->unkB4;
        if (*object == NULL) {
            break;
        }
        sub_8050A50((DisplayData*)&state->transition.unk590);
        if (state->motion.count != 0) {
            sub_805041C(&state->motion);
        }
        if ((*object)->unk4->unk14 != 0) {
            sub_804A110();
        }
        sub_80434EC(state);
        sub_8049344(4);
        state->transition.value += state->transition.unk585;
        sub_8057930();
        sub_80490CC(8, count++);
        if (state->transition.unk585 == 0) {
            if ((*object)->unk4->unk20 != 0) {
                sub_804374C(state);
            }
            sub_80490CC(2, 0);
        }
        if (_unk3000650.transition.value == _unk3000650.transition.unk586) {
            _unk3000650.transition.value = _unk3000650.transition.unk586;
            sub_8049344(1);
            _unk3000650.transition.unk585 = 0;
        }
    }
    sub_804A280(&_unk3000650);
}

void sub_80495C4(void)
{
    FrontendSubobject* selected;
    const FrontendObject* record;
    FrontendSubobject* state;
    FrontendMotionData* data;
    FrontendState* base;

    base = &_unk3000650;
    state = base->unkB4->unk4;
    if (base->unk4 != -1) {
        record = &_8069FC8[base->unk4];
        selected = record->unk4;
    } else {
        selected = NULL;
    }
    if (_unk3000650.motion.count != 0) {
        data = state->unk10->unk28;
        if (data != NULL) {
            sub_80504E4(&_unk3000650.motion, data->unk0, data->unk4, data->unk8, data->unkC);
            sub_805052C(&_unk3000650.motion, data->unk10, data->unk14, data->unk18, data->unk1C);
            sub_8050578(&_unk3000650.motion, data->unk20, data->unk26);
        }
    }
    sub_8043558(&_unk3000650);
    if (selected != NULL && selected->palette != NULL && sub_8048FFC() != 0) {
        sub_804903C(&_unk3000650.bgLayers[1], selected->palette->unk0, selected->palette->unk4);
    }
}

void sub_804967C(void)
{
    FrontendSubobject* object;
    FrontendSubobjectData* cursor;
    FrontendMotionData* motionData;
    SpriteTextCleanup* destination;
    s32 index;

    sub_80490CC(7, 0);
    if (_unk3000650.unk0 != -1) {
        if (_unk3000650.unk424 != NULL) {
            if (_unk3000650.unk470 != NULL) {
                SpriteTextCleanup* cleanup;
                s32 count;

                cleanup = _unk3000650.unk470;
                count = _unk3000650.unkB4->unk4->unk14;
                count--;
                while (count != -1) {
                    sub_8061204(cleanup);
                    cleanup++;
                    count--;
                }
                _unk3000650.unk470 = NULL;
            }
            deallocateBlock(_unk3000650.unk424);
            _unk3000650.unk424 = NULL;
        }
        sub_80436B0(&_unk3000650);
        if (_unk3000650.motion.count != 0) {
            sub_8050584(&_unk3000650.motion);
            sub_8061204(&_unk3000650.unk428);
        }
    }
    if (_unk3000650.unk4 != -1) {
        _unk3000650.unkB4 = &_8069FC8[_unk3000650.unk4];
    } else {
        _unk3000650.unkB4 = NULL;
    }
    _unk3000650.unk0 = _unk3000650.unk4;
    if (_unk3000650.unk4 == -1) {
        return;
    }
    object = _unk3000650.unkB4->unk4;
    _unk3000650.unk80 &= 0xF3;
    StoreFunction(0);
    _unk3000BFD = 0;
    if (_unk3000650.transition.unk58C != NULL) {
        _unk3000650.transition.unk58C();
    } else if (_unk3000650.unkB4->unkC != NULL) {
        _unk3000650.unkB4->unkC();
    }
    sub_8049330(0);
    sub_8049344(2);
    if (object->unk14 * sizeof(SpriteTextCleanup) != 0) {
        _unk3000650.unk424 = slowAllocate(object->unk14 * sizeof(SpriteTextCleanup));
        if (_unk3000650.unk424 != NULL) {
            _unk3000650.unk470 = _unk3000650.unk424->address;
            destination = _unk3000650.unk470;
            cursor = object->unk18;
            index = object->unk14;
            while (--index != -1) {
                allocFont(destination, cursor->unk8->unk0, cursor->unk8->unk4, cursor->unk0,
                    cursor->unk2, cursor->unk20, cursor->unk8->unk8);
                sub_8061660(destination, cursor->unkC[getLanguage()], cursor->unk8->unkA);
                cursor++;
                destination++;
            }
        }
    }
    if (object->unk10 != NULL) {
        motionData = object->unk10->unk24;
        allocFont(&_unk3000650.unk428, object->unk10->unk8->unk0, object->unk10->unk8->unk4,
            object->unk10->unk0, object->unk10->unk2, object->unk10->unk20,
            object->unk10->unk8->unk8);
        sub_8061660(
            &_unk3000650.unk428, object->unk10->unkC[getLanguage()], object->unk10->unk8->unkA);
        if (object->unk10->unk24 != NULL) {
            newMotionGroup(&_unk3000650.motion, &_unk3000650.unk428.unk14, motionData->unk24);
            sub_80504E4(&_unk3000650.motion, motionData->unk0, motionData->unk4, motionData->unk8,
                motionData->unkC);
            sub_805052C(&_unk3000650.motion, motionData->unk10, motionData->unk14,
                motionData->unk18, motionData->unk1C);
            sub_8050578(&_unk3000650.motion, motionData->unk20, motionData->unk26);
        }
    }
    sub_8043370(&_unk3000650);
    sub_80490CC(0, 0);
}
