#include "tutorial.h"

#include <agb/memory_map.h>
#include <agb/types.h>

#include "effects.h"
#include "frontend.h"
#include "gamestate.h"
#include "geometry.h"
#include "include_asm.h"
#include "iwram.h"
#include "keystate.h"
#include "layer.h"
#include "menu.h"
#include "music.h"
#include "sprite.h"
#include "spritetext.h"
#include "teletype.h"
#include "text.h"
#include "unsorted.h"

extern const SpriteSheet SpriteSheet_8282D3C;
extern const SpriteSheet SpriteSheet_82875D4;
extern FrontendMotionData _8068954;
extern FrontendMotionData _806897C;

typedef struct BackgroundAsset {
    BGLayer layer;
    TilemapTextRenderer renderer;
} BackgroundAsset;

void sub_804A2F0(void)
{
    sub_804AE34(0, 0x3C);
}

void sub_804A300(void)
{
    sub_804AE34(0, 0x3C);
}

void sub_804A310(void)
{
    sub_804AE34(0, 0x3C);
}

void sub_804A320(void)
{
    sub_804AE34(0, 0x3C);
}

void sub_804A330(unk32 arg0)
{
    _unk3000650.unk81 = arg0;
}

unk8 sub_804A33C(void)
{
    return _unk3000650.unk81;
}

void sub_804A348(void)
{
    sub_804AE34(0, 0x3C);
}

void StoreLevelVar14(unk32 arg0)
{
    _unk3000C00 = arg0;
}

const unk8* const* sub_804A364(void)
{
    return sub_804A378(_unk3000C00);
}

const unk8* const* sub_804A378(unk32 arg0)
{
    return _806A77C[arg0];
}

extern const SpriteSheet SpriteSheet_82B05EC;
extern const unk8 ShadowFontMeta[];
extern const SpriteSheet SpriteSheet_821CCC8;
extern const SpriteSheet SpriteSheet_821CB80;
extern TutorialPage TutorialPages[];

void initTutorialManagement(u16 levelId)
{
    LevelGeometryAddresses geometry;
    TutorialData* data;
    TutorialEntry* entry;
    LevelGeometryTable* geometryData;
    LineMetadata** metadata;
    LineMetadata* lineMetadata;
    LineMetaObject* metaobject;
    s32 count;
    s32 line;

    data = &_gameData->tutorial;
    entry = data->entries;
    geometryData = loadLevelGeometry(levelId);
    metadata = getLevelMetadata(levelId);
    sub_8051734();
    count = 0;
    __fastMemoryClearARM(0, data, sizeof(TutorialData));
    if (metadata != NULL && geometryData != NULL) {
        getLevelGeometryAddresses(&geometry, geometryData);
        StoreMetadataAddr(&geometry, metadata);
        line = 0;
        while (line < geometry.unk0->lineCount) {
            lineMetadata = GetLineMetaData(&geometry, line);
            if (count > 0x1F) {
                printf("unable to add Tutorial Triggers in initTutorialManagement()\n");
                break;
            }
            line++;
            if (lineMetadata != 0) {
                metaobject = getLineMetaobjectByTypeAndId(&geometry, lineMetadata, 1, 0x8CEC);
                if (metaobject != NULL) {
                    entry->line = line;
                    entry->sprite = &TutorialPages[metaobject->unk8.word];
                    count++;
                    entry++;
                }
            }
        }
        data->unk104 = 0;
        data->count = count;
        allocFont(&data->fontData, &SpriteSheet_82B05EC, ShadowFontMeta, 0x24, 0x73, 0xBA, 0);
        data->unk138 = 0;
        data->unk13C = 0;
    }
}

TutorialPage TutorialPages[] = {
    {
        { 3, 3, 3, 3, 3 },
        {
            { "Use the +Control Pad to move...", "Usa el Panel de Control...",
                "Mit dem Steuerkreuz kannst du ...", "Utilise la manette + pour déplacer...",
                "Usa la pulsantiera di comando... " },
            { "your Beyblade around the level...", "para mover tu Peonza por el nivel...",
                "dein Beyblade auf dem Level bewegen...", "ton Beyblade dans le niveau...",
                "per muovere il tuo Beyblade nel livello..." },
            { "Try to reach the exit area.", "Intenta llegar al área de salida.",
                "Versuche, die Endzone zu erreichen.", "Essaie de rejoindre la zone de sortie.",
                "Cerca di raggiungere la zona di arrivo." },
            { "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE" },
        },
    },
    {
        { 5, 5, 5, 5, 5 },
        {
            { "Move your Beyblade over the...", "Mueve tu peonza sobre el objeto...",
                "Wenn du dein Beyblade über ein Objekt bewegst...",
                "Amène ton Beyblade sur l'objet...",
                "Per raccogliere un oggetto che hai davanti..." },
            { "object in front to pick it up...", "que tienes delante para cogerlo...",
                "kannst du es einsammeln...", "qui se trouve devant pour le ramasser...",
                "passaci sopra con il Beyblade..." },
            { "Complete the level after...", "Completa el nivel tras ...", "Füge das Objekt...",
                "Termine le niveau après...", "Completa il livello dopo..." },
            { "collecting an item...", "coger un objeto...", "deiner Sammlung hinzu...",
                "avoir ramassé un objet...", "aver preso un oggetto..." },
            { "to add it to your collection.", "para añadirlo a tu colección.",
                "und beende das level.", "pour l'ajouter à ta collection.",
                "per aggiungerlo alla tua raccolta." },
        },
    },
    {
        { 1, 1, 1, 1, 1 },
        {
            { "Here is another type of collectable.",
                "Aquí hay otro tipo de objeto que puedes recoger.",
                "Dies ist ein weiteres Objekt zum sammeln.",
                "Voici un autre type d'objet à ramasser.",
                "Ecco un altro tipo di oggetto da raccogliere." },
            { "NULL", "PAGE 1 TEXT GOES HERE", "PAGE 1 TEXT GOES HERE", "PAGE 1 TEXT GOES HERE",
                "PAGE 1 TEXT GOES HERE" },
            { "NULL", "PAGE 2 TEXT GOES HERE", "PAGE 2 TEXT GOES HERE", "PAGE 2 TEXT GOES HERE",
                "PAGE 2 TEXT GOES HERE" },
            { "NULL", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE" },
        },
    },
    {
        { 4, 4, 4, 4, 4 },
        {
            { "The checkered area on the left...", "El área a cuadros a la izquierda...",
                "Der karierte Bereich auf der linken...", "La zone à damiers à gauche...",
                "La zona a scacchi..." },
            { "of the screen is the exit...", "de la pantalla es la salida...",
                "Bildschirmseite ist die Endzone...", "de l'écran est la sortie...",
                "a sinistra è l'arrivo..." },
            { "Move your Beyblade on to it...", "Ileva tu peonza hasta ella... ",
                "Bewege dein Beyblade dorthin... ", "Amène ton Beyblade dessus... ",
                "Raggiungila con il Beyblade..." },
            { "to complete the level.", "para completar el nivel.", "um das Level zu beenden.",
                "pour terminer le niveau.", "per completare il livello." },
        },
    },
    {
        { 3, 3, 3, 3, 3 },
        {
            { "These red arrows are Speed Ups...", "Estas flechas rojas son aceleradores...",
                "Die roten Pfeile sind Speed-up Anzeigen.",
                "Ces flèches rouges sont des bonus de vitesse...",
                "Queste frecce rosse sono bonus velocità..." },
            { "If you touch one, it will push you...",
                "Si tocas uno, te empujará en la dirección...",
                "Wenn du sie berührst, wirst du in die Richtung bewegt...",
                "Si tu en touches un, il te poussera...", "Se ne tocchi una, ti spinge nella..." },
            { "in the direction the arrow is pointing.", "en la que apunta la flecha.",
                "in die sie zeigen.", "dans la direction indiquée par la flèche.",
                "direzione verso cui è puntata." },
            { "NULL", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE" },
        },
    },
    {
        { 2, 2, 2, 2, 2 },
        {
            { "Try to control your speed...", "¡Intenta controlar tu velocidad...",
                "Kontrolliere dein Tempo, um das Gleichgewicht...",
                "Essaie de contrôler ta vitesse...", "Cerca di controllare la velocità..." },
            { "so you don't fall off.", "para no caerte!", "nicht zu verlieren!",
                "afin de ne pas tomber!", "per non cadere!" },
            { "NULL", "PAGE 2 TEXT GOES HERE", "PAGE 2 TEXT GOES HERE", "PAGE 2 TEXT GOES HERE",
                "PAGE 2 TEXT GOES HERE" },
            { "NULL", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE" },
        },
    },
    {
        { 5, 5, 5, 5, 5 },
        {
            { "As your Beyblade loses spin...", "Cuando tu peonza pierda velocidad de giro...",
                "Wenn dein Beyblade an Schwung verliert...", "Si ton Beyblade ralentit...",
                "Quando il tuo Beyblade perde velocità di rotazione..." },
            { "the bar at the top of the screen...",
                "la barra de la parte superior de la pantalla...", "sinkt die Anzeige am oberen...",
                "la barre en haut de l'écran...", "la barra in alto..." },
            { "decreases...", "disminuye...", "Bildschirmrand...", "diminuera...",
                "si accorcia..." },
            { "Use these Spin Charges to...", "Usa estas cargas de velocidad de giro...",
                "Mit diesen Dreh-Ladungen erhöht sich...", "Utilise les charges de rotation...",
                "Usa queste cariche per..." },
            { "fully replenish your spin.", "para rellenar tu velocidad de giro.",
                "das Drehtempo deines Beyblades wieder.", "pour relancer ton Beyblade.",
                "riguadagnare velocità di rotazione." },
        },
    },
    {
        { 4, 4, 4, 4, 4 },
        {
            { "The green tiles in front...", "Las baldosas verdes de delante lanzarán...",
                "Die grünen Plattformen da vorne befördern...", "Les dalles vertes lanceront...",
                "Le caselle verdi davanti a te lanciano..." },
            { "will launch your Beyblade upwards...", "tu peonza hacia arriba...",
                "deinen Beyblade nach oben...", "ton Beyblade vers le haut...",
                "il tuo Beyblade verso l'alto..." },
            { "making it possible to jump...", "haciendo posible que saltes muros...",
                "So kannst du Mauern und Spalten...", "lui permettant de sauter...",
                "permettendoti di superare..." },
            { "over walls and gaps.", "y huecos.", "überwinden.", "murs et fosses.",
                "muri e varchi." },
            { "NULL", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE" },
        },
    },
    {
        { 4, 4, 4, 4, 4 },
        {
            { "The lower your spin...", "Cuanto más baja sea tu velocidad de giro...",
                "Mit weniger Drehtempo ist es viel schwieriger...",
                "Plus ton Beyblade tournera lentement...",
                "Più bassa è la tua velocità di rotazione..." },
            { "the harder your Beyblade will be...", "más difícil será controlar tu peonza,",
                "deinen Beyblade zu kontrollieren...", "plus il sera difficile à contrôler,",
                "più difficile diventa il tuo Beyblade..." },
            { "to control, making narrow pathways...", "seguir caminos estrechos es mucho...",
                "und über schmale Pfade...", "ce qui rendra les passages étroits...",
                "da controllare, soprattutto lungo..." },
            { "a lot more difficult.", "más difícil.", "zu steuern.", "plus délicats.",
                "i passaggi stretti." },
            { "NULL", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE" },
        },
    },
    {
        { 2, 2, 2, 2, 2 },
        {
            { "Move your Beyblade onto...", "Coloca tu peonza sobre...",
                "Um herüber zu kommen, musst du dein Beyblade...",
                "Amène ton Beyblade sur la plate-forme...", "Sposta il tuo Beyblade sulla..." },
            { "moving platforms to get across.", "la plataforma móvil para cruzar.",
                "auf die beweglichen Plattformen steuern.", "mobile pour traverser.",
                "piattaforma mobile per procedere." },
            { "NULL", "PAGE 2 TEXT GOES HERE", "PAGE 2 TEXT GOES HERE", "PAGE 2 TEXT GOES HERE",
                "PAGE 2 TEXT GOES HERE" },
            { "NULL", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE" },
            { "NULL", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE" },
        },
    },
    {
        { 3, 3, 3, 3, 3 },
        {
            { "Ahead of you are some enemy...", "Delante de ti hay varias peonzas enemigas...",
                "Vor dir siehst du feindliche Beyblades...",
                "Il y a devant toi des Beyblades ennemis...",
                "Di fronte hai alcuni Beyblade nemici..." },
            { "Beyblades. Ram into them to...", "Embístelas para sacarlas...",
                "Ramme sie und befördere...", "Cogne-les pour les éjecter...",
                "Speronali per buttarli fuori..." },
            { "knock them out of the arena.", "de la arena.", "sie aus der Arena.", "de l'arène.",
                "dall'arena." },
            { "NULL", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE" },
            { "NULL", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE" },
        },
    },
    {
        { 4, 4, 4, 4, 4 },
        {
            { "For each enemy you destroy...", "Por cada enemigo que destruyas...",
                "Mit jedem Gegner, den du schlägst...", "Chaque ennemi détruit augmente...",
                "Per ogni nemico distrutto..." },
            { "your bit charge gains a point...", "tu carga de bits aumentará 1 punto...",
                "erhöht sich deine Bit-Ladung um 1 punkt...",
                "d'un point ta charge de bit beast...", "guadagni un punto di carica bit..." },
            { "Get 5 points and you will be...", "Consigue 5 puntos y podrás...",
                "Mit 5 Punkten kannst du einen...", "Accumule 5 points et tu pourras...",
                "Raggiungi 5 punti e potrai usare..." },
            { "able to unleash your Bit Beast Attack!", "liberar tus ataques bit beast!",
                "Bit Beast-Angriff starten!", "lancer ton attaque de bit beast!",
                "il tuo attacco bit beast!" },
            { "NULL", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE" },
        },
    },
    {
        { 5, 5, 5, 5, 5 },
        {
            { "If you managed to knock off every...", "Si has conseguido derribar a todas...",
                "Wenn du alle Beyblades aus dem Weg geräumt...", "Si tu as réussi à éliminer...",
                "Se sei riuscito a eliminare tutti i Beyblade..." },
            { "Beyblade so far, your bit charge...",
                "las peonzas hasta el momento, tu carga de bits...",
                "und deine Bit-ladung hochgefahren hast...", "tous les Beyblades jusqu'ici...",
                "la tua carica bit dovrebbe essere..." },
            { "will now be full. Use the L Button...",
                "estará llena; usa el Botón L para liberar...", "kannst du mit der L-Taste...",
                "ta charge sera complète...", "al massimo. premi il pulsante L..." },
            { "to unleash the Beast when you are...", "a la bestia cuando estés...",
                "einen Bit Beast-Angriff starten,", "Utilise le bouton L pour lancer...",
                "per usare il bit beast quando..." },
            { "near to an enemy.", "cerca de un enemigo.",
                "wenn du in der Nähe eines Feindes bist.", "ton bit beast près d'un ennemi.",
                "sei vicino a un nemico." },
        },
    },
    {
        { 4, 4, 4, 4, 4 },
        {
            { "It's an enemy Beyblade.", "Es una peonza enemiga...",
                "Das ist ein feindliches Beyblade...", "C'est un Beyblade ennemi...",
                "E un Beyblade nemico..." },
            { "Knock him off to complete the...", "derríbala para completar el nivel...",
                "Ramm es weg, um das Level zu beenden.", "ejecte-le pour terminer le niveau...",
                "eliminalo per completare il livello..." },
            { "level. Maybe you should try...", "Quizá deberías intentar derribarla...",
                "Vielleicht solltest du es in Richtung...", "Essaie de le pousser...",
                "Forse ti conviene provare a lanciarlo..." },
            { "to knock him onto a Speed Up tile.", "sobre una baldosa aceleradora.",
                "der grünen Speed-up-Pfeile rammen.", "sur une case d'accéleration.",
                "verso un bonus velocità." },
            { "NULL", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE", "PAGE 3 TEXT GOES HERE",
                "PAGE 3 TEXT GOES HERE" },
        },
    },
};

FrontendSubobjectData _806D9B8 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Select Language", "Seleccionar idioma", "Sprache auswählen", "Choix de la langue",
        "Scegli la lingua" },
    240, { 0 }, &_8068954, &_806897C };

FrontendMenuItemData SubMenu_134666724[] = {
    { &SpriteSheet_8282D3C, { "english", "english", "english", "english", "english" }, 0x2000,
        0x2000, 0x100, 0x136, 0, 5 },
    { &SpriteSheet_8282D3C, { "español", "español", "español", "español", "español" }, 0x2000,
        0x2000, 0x100, 0x136, 2, 5 },
    { &SpriteSheet_8282D3C, { "deutsch", "deutsch", "deutsch", "deutsch", "deutsch" }, 0x2000,
        0x2000, 0x100, 0x136, 4, 5 },
    { &SpriteSheet_8282D3C, { "français", "français", "français", "français", "français" }, 0x2000,
        0x2000, 0x100, 0x136, 1, 5 },
    { &SpriteSheet_8282D3C, { "italiano", "italiano", "italiano", "italiano", "italiano" }, 0x2000,
        0x2000, 0x100, 0x136, 3, 5 },
};

FrontendSubobjectData _806DAD4 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Continue?", "¿Continuar?", "Fortfahren?", "Continuer?", "Vuoi continuare?" }, 240, { 0 },
    &_8068954, &_806897C };

FrontendMenuItemData SubMenu_134667008[] = {
    { &SpriteSheet_82875D4, { "Yes", "sí", "Ja", "Oui", "sì" }, 0x2000, 0x2000, 0x100, 0x136, 9,
        0x20 },
    { &SpriteSheet_82875D4, { "No", "No", "Nein", "Non", "No" }, 0x2000, 0x2000, 0x100, 0x136, 0xA,
        0x21 },
};

FrontendSubobjectData _806DB60 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Congratulations", "Enhorabuena", "Herzlichen Glückwunsch", "Félicitations",
        "Congratulazioni" },
    240, { 0 }, &_8068954, &_806897C };

const unk8* _806DB8C[][5] = {
    { "Result ", "Resultados ", "Ergebnisse ", "Résultats  ", "Risultati " },
    { "Congratulations! You're the winner.", "¡Tú ganas!", "Du hast gewonnen!", "Tu as gagné !",
        "Hai vinto!" },
    { "You lost! Try again!", "¡Tú pierdes!", "Du hast verloren!", "Tu as perdu !", "Hai perso!" },
    { "It's a draw!", "¡Es un empate!", "Unentschieden!", "Egalité !", "È un pareggio!" },
};

FrontendSubobjectData _806DBDC = { 4, -32, 4, 4, &FontStyle_806890C,
    { "You Lose!", "¡Tú pierdes!", "Du hast verloren!", "Tu as perdu!", "Hai perso!" }, 240, { 0 },
    &_8068954, &_806897C };

FrontendSubobjectData _806DC08 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Draw", "Empate", "Unentschieden", "Egalité", "Pareggio" }, 240, { 0 }, &_8068954,
    &_806897C };

FrontendSubobjectData _806DC34 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Continue?", "¿Continuar?", "Fortfahren?", "Continuer?", "Vuoi continuare?" }, 240, { 0 },
    &_8068954, &_806897C };

FrontendMenuItemData SubMenu_134667360[] = {
    { &SpriteSheet_82875D4, { "Yes", "sí", "Ja", "Oui", "sì" }, 0x2000, 0x2000, 0x100, 0x136, 9,
        0x20 },
    { &SpriteSheet_82875D4, { "No", "No", "Nein", "Non", "No" }, 0x2000, 0x2000, 0x100, 0x136, 0xA,
        0x21 },
    { &SpriteSheet_82875D4,
        { "BeyCollection", "BeyColección", "BeySammlung", "BeyCollection", "RACCOLTABEY" }, 0x2000,
        0x2000, 0x100, 0x136, 1, 0x18 },
    { &SpriteSheet_82875D4,
        { "Save", "Guardar partida", "Spiel speichern", "Sauvegarder", "Salva partita" }, 0x2000,
        0x2000, 0x100, 0x136, 0xD, 0x24 },
};

static FrontendMotionData _806DD20 = { 0, 0x40, 0, -4, 0, 0x500, 0, -0x10, 0x6C00, 2, 0x64 };

static FrontendMotionData _806DD48 = { 0, 0x80, 0, 0x20 };

FrontendSubobjectData _806DD70 = { 0, -32, 0, 8, &FontStyle_8068900,
    { "PRESS START", "PULSA START", "START DRÜCKEN", "APPUIE SUR START", "PREMI START" }, 240,
    { 0 }, &_806DD20, &_806DD48 };

FrontendSubobjectData _806DD9C = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Main", "Menú principal", "Hauptmenü", "Menu principal", "Menu principale" }, 240, { 0 },
    &_8068954, &_806897C };

FrontendMenuItemData SubMenu_134667720[] = {
    { &SpriteSheet_82875D4,
        { "VForce Adventure", "VForce Aventura", "VForce Abenteuer", "VForce Aventure",
            "AVVENTURA VFORCE" },
        0x2000, 0x2000, 0x100, 0x136, 0, 0x17 },
    { &SpriteSheet_82875D4,
        { "BBA Multiplayer", "BBA Multijugador", "BBA Mehrspieler", " BBA Multijoueur",
            "BBA Multigiocatore" },
        0x2000, 0x2000, 0x100, 0x136, 2, 0x19 },
    { &SpriteSheet_82875D4,
        { "Beyworkshop", "BBeytaller", "Beywerkstatt", "Atelier Bey", "Negozio" }, 0x2000, 0x2000,
        0x100, 0x136, 3, 0x1A },
    { &SpriteSheet_82875D4, { "Options", "Opciones", "Optionen", "Options", "Opzioni" }, 0x2000,
        0x2000, 0x100, 0x136, 4, 0x1B },
    { &SpriteSheet_82875D4,
        { "BeyCollection", "BeyColección", "BeySammlung", "BeyCollection", "RACCOLTABEY" }, 0x2000,
        0x2000, 0x100, 0x136, 1, 0x18 },
};

FrontendMenuItemData SubMenu_134667960[] = {
    { &SpriteSheet_82875D4, { "Audio", "Sonido", "Audio", "Audio", "Audio" }, 0x2000, 0x2000, 0x100,
        0x136, 5, 0x1C },
    { &SpriteSheet_82875D4,
        { "Save Game", "Guardar partida", "Spiel speichern", "Sauvegarder la Partie",
            "Salva partita" },
        0x2000, 0x2000, 0x100, 0x136, 0xD, 0x24 },
    { &SpriteSheet_82875D4, { "Credits", "Créditos", "Mitwirkende", "Crédits", "Riconoscimenti" },
        0x2000, 0x2000, 0x100, 0x136, 0x11, 0x28 },
    { &SpriteSheet_82875D4, { "Controls", "Controles", "Steuerung", "Commandes", "Comandi" },
        0x2000, 0x2000, 0x100, 0x136, 6, 0x1D },
};

FrontendSubobjectData _806DF78 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Options", "Opciones", "Optionen", "Options", "Opzioni" }, 240, { 0 }, &_8068954, &_806897C };

FrontendSubobjectData _806DFA4 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Audio", "Sonido", "Audio", "Audio", "Audio" }, 240, { 0 }, &_8068954, &_806897C };

const unk8* _806DFD0[][5] = {
    { "Sfx", "EFECTOS", "Sfx", "SONS", "Sfx" },
    { "Music", "Música", "Musik", "MUSIQUE", "Musica" },
};

FrontendSubobjectData _806DFF8 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Collection", "Colección", "Sammlung", "Collection", "Raccolta" }, 240, { 0 }, &_8068954,
    &_806897C };

FrontendSubobjectData _806E024 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "SAVE GAME", "GUARDAR PARTIDA", "SPIEL SPEICHERN", "SAUVEGARDER LA PARTIE", "SALVA PARTITA" },
    240, { 0 }, &_8068954, &_806897C };

FrontendMenuItemData SubMenu_134668368[] = {
    { &SpriteSheet_82875D4, { "Yes", "sí", "Ja", "Oui", "sì" }, 0x2000, 0x2000, 0x100, 0x136, 9,
        0x20 },
    { &SpriteSheet_82875D4, { "No", "No", "Nein", "Non", "No" }, 0x2000, 0x2000, 0x100, 0x136, 0xA,
        0x21 },
};

FrontendSubobjectData _806E0B0 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "SAVING", "GUARDANDO", "SPEICHERVORGANG", "SAUVEGARDE", "SALVATAGGIO" }, 240, { 0 },
    &_8068954, &_806897C };

const unk8* _806E0DC[][5] = {
    { "Saving. Do not turn the power off.", "Guardando. No apagues la consola.",
        "Speichervorgang. Nicht ausschalten.", "Sauvegarde. Ne pas éteindre",
        "Salvataggio. Non spegnere la console" },
    { "Save successful. Press the A Button to continue.",
        "Guardado con éxito. Pulsa el Botón A para continuar.",
        "Speichern erfolgreich. Weiter mit dem A-Knopf.",
        "Sauvegarde réussie. Appuie sur le bouton A pour continuer.",
        "Salvataggio riuscito. Premi il pulsante A per continuare." },
    { "Save failed.", "Error al guardar.", "Speichern fehlgeschlagen.", "Echec de la sauvegarde.",
        "Salvataggio fallito." },
    { "Warning! Saving will overwrite any previously saved game data.",
        "Guardar sobrescribirá todos los datos de juego guardados anteriormente.",
        "Warnung! Durch das Speichern wird der ältere Spielstand überschrieben.",
        "Attention! Une nouvelle sauvegarde écrasera les données précédemment enregistrées.",
        "Attenzione! Salvando si sovrascriveranno i dati precedentemente salvati." },
};

FrontendSubobjectData _806E12C = { 4, -32, 4, 4, &FontStyle_806890C,
    { "WARNING", "¡ATENCIÓN!", "WARNUNG", "AVERTISSEMENT", "ATTENZIONE" }, 240, { 0 }, &_8068954,
    &_806897C };

FrontendSubobjectData _806E158 = { 256, 74, 0, 74, &FontStyle_80688C4,
    { "\x8F", "\x8F", "\x8F", "\x8F", "\x8F" }, 208, { 0 }, NULL, NULL };

FrontendSubobjectData _806E184 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "GAME", "PARTIDA", "SPIEL", "PARTIE", "partita" }, 240, { 0 }, &_8068954, &_806897C };

FrontendMenuItemData SubMenu_134668720[] = {
    { &SpriteSheet_82875D4,
        { "Continue Game", "Continuar Partida", "SPIEL FORTFAHREN", "Continuer la partie",
            "Continua Partita" },
        0x2000, 0x2000, 0x100, 0x136, 0xC, 0x23 },
    { &SpriteSheet_82875D4,
        { "New Game", "Nueva Partida", "NEUES SPIEL", "Nouvelle Partie", "Nuova Partita" }, 0x2000,
        0x2000, 0x100, 0x136, 0xB, 0x22 },
    { &SpriteSheet_82875D4,
        { "Load Game", "Cargar partida", "Spiel laden.", "Charger partie", "Carica partita" },
        0x2000, 0x2000, 0x100, 0x136, 0xE, 0x25 },
};

const unk8* _806E240[][5] = {
    { "beyblade", "beyblade", "beyblade", "beyblade", "beyblade" },
    { "attack ring", "Anillo de ataque", "Power-Ring", "Anneau d'attaque", "Disco d'attacco" },
    { "weight disk", "Pesa del disco", "Gewicht-Ring", "Disque lesté", "Peso" },
    { "blade base", "Base del trompo", "Blade-Basis", "Base de Beyblade", "Base del Beyblade" },
    { "spin gear", "Engranaje rotación", "Kreiselscheibe", "Engrenages",
        "Meccanismo di rotazione" },
    { "Attack", "Ataque", "Angriff", "Attaque", "Attacco" },
    { "Defense", "Defensa", "Verteidigung", "Défense", "Difesa" },
    { "Endurance", "Resistencia", "Ausdauer", "Endurance", "Resistenza" },
    { "Spin: left", "Giro: a izquierda", "Drehrichtung: links", "Rotation: G", "Rotazione: sx" },
    { "Spin: right", "Giro: a derecha", "Drehrichtung: rechts", "Rotation: D", "Rotazione: dx" },
    { "Info", "Información", "Info", "Info", "Info" },
};

const unk8* _806E31C[][5] = {
    { "Name: ", "Nombre: ", "Name: ", "Nom: ", "Nome: " },
    { "Type: ", "Tipo: ", "Typ: ", "Type: ", "Tipo: " },
    { "Bit Beast: ", "Bit Beast: ", "Bit Beast: ", "Bit Beast: ", "Bit Beast: " },
};

FrontendSubobjectData _806E358 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Select", "Seleccionar", "Auswählen", "Sélection", "Scegli" }, 240, { 0 }, &_8068954,
    &_806897C };

FrontendSubobjectData _806E384 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Breakdown", "Avería", "Unterbrechung", "Casse", "Spaccato" }, 240, { 0 }, &_8068954,
    &_806897C };

const unk8* _806E3B0[][5] = {
    { "Please ensure Game Boy® Advance Game Link® Cable is connected",
        "Asegurate de que el cable Game Link de Game Boy Advance esta conectado",
        "Bitten prüfen, ob Game Boy Advance Game Link-Kabel angeschlossen ist.",
        "Assure-toi de bien connecter le câble Game Boy Advance Game Link",
        "Assicurati che il cavo Game Link per Game Boy Advance sia connesso" },
};

FrontendMenuItemData SubMenu_134669252[] = {
    { &SpriteSheet_82875D4, { "Retry", "Reintentar", "Nochmal", "Réessayer", "Riprova" }, 0x2000,
        0x2000, 0x100, 0x136, 9, 0x20 },
    { &SpriteSheet_82875D4, { "Cancel", "Cancelar", "Abbrechen", "Annuler", "Annulla" }, 0x2000,
        0x2000, 0x100, 0x136, 0xA, 0x21 },
};

FrontendSubobjectData _806E424 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Retry?", "¿Reintentar?", "Erneut versuchen?", "Réessayer?", "Vuoi riprovare?" }, 240, { 0 },
    &_8068954, &_806897C };

FrontendSubobjectData _806E450 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Game mode", "Modo de juego", "Spielmodus", "Mode de jeu", "Modalità di gioco" }, 240, { 0 },
    &_8068954, &_806897C };

FrontendMenuItemData SubMenu_134669436[] = {
    { &SpriteSheet_82875D4, { "Race", "Carrera", "Rennen", "Course", "Gara" }, 0x2000, 0x2000,
        0x100, 0x136, 0x10, 0x27 },
    { &SpriteSheet_82875D4, { "Battle", "Batalla", "Kampf", "Combat", "Battaglia" }, 0x2000, 0x2000,
        0x100, 0x136, 0xF, 0x26 },
};

FrontendSubobjectData _806E4DC = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Rounds", "Rondas", "Runden", "Rounds", "Round" }, 240, { 0 }, &_8068954, &_806897C };

FrontendMenuItemData SubMenu_134669576[] = {
    { &SpriteSheet_82875D4, { "1 Round", "1 Ronda", "1 Runde", "1 Round", "1 Round" }, 0x2000,
        0x2000, 0x100, 0x136, 0x12, 0x29 },
    { &SpriteSheet_82875D4, { "3 Rounds", "3 Rondas", "3 Runden", "3 Rounds", "3 Round" }, 0x2000,
        0x2000, 0x100, 0x136, 0x13, 0x2A },
    { &SpriteSheet_82875D4, { "5 Rounds", "5 Rondas", "5 Runden", "5 Rounds", "5 Round" }, 0x2000,
        0x2000, 0x100, 0x136, 0x14, 0x2B },
    { &SpriteSheet_82875D4, { "7 Rounds", "7 Rondas", "7 Runden", "7 Rounds", "7 Round" }, 0x2000,
        0x2000, 0x100, 0x136, 0x15, 0x2C },
    { &SpriteSheet_82875D4, { "9 Rounds", "9 Rondas", "9 Runden", "9 Rounds", "9 Round" }, 0x2000,
        0x2000, 0x100, 0x136, 0x16, 0x2D },
};

FrontendSubobjectData _806E5F8 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Please wait...", "Espera, por favor...", "Bitte warten...", "Un instant...", "Attendi..." },
    240, { 0 }, &_8068954, &_806897C };

FrontendSubobjectData _806E624 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Well Done", "¡Bien hecho!", "Gut gemacht!", "Bien joué!", "Ben fatto!" }, 240, { 0 },
    &_8068954, &_806897C };

const unk8* _806E650[5] = { "Congratulations, you have unlocked ", "Enhorabuena, has desbloqueado ",
    "Gratulation, neu freigeschaltet ", "Félicitations, tu as débloqué ",
    "Congratulazioni, hai sbloccato " };

FrontendSubobjectData _806E664 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Credits", "Créditos", "Mitwirkende", "Crédits", "Riconoscimenti" }, 240, { 0 }, &_8068954,
    &_806897C };

FrontendSubobjectData _806E690 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Map", "SUMARIO", "Karte", "Carte", "Mappa" }, 240, { 0 }, &_8068954, &_806897C };

FrontendSubobjectData _806E6BC = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Collection", "Colección", "Sammlung", "Collection", "Raccolta" }, 240, { 0 }, &_8068954,
    &_806897C };

const unk8* _806E6E8[5]
    = { "Let It Rip", "¡Adelante!", "Let It Rip", "Hyper vitesse!", "Pronti... lancio!" };

const unk8* _806E6FC[5] = { "Round cleared!", "¡Ronda superada!", "Runde bestanden!",
    "Round réussi!", "Round superato!" };

const unk8* _806E710[5]
    = { "Spin Out", "¡A girar!", "Kein Schwung mehr!", "Arrêt!", "Fine rotazione!" };

const unk8* _806E724[4][5] = {
    { "Metal Ball Defense", "Defensa de Bola Metálica", "Metal Ball Defense", "Metal Ball Defense",
        "Difesa con le sfere metalliche" },
    { "Tiger Claw", "Garra de Tigre", "Tiger Claw", "Tiger Claw", "Artiglio di tigre" },
    { "Phantom Hurricane", "Huracán Fantasma", "Phantom Hurricane", "Phantom Hurricane",
        "Attacco tifone" },
    { "Fire Arrow", "Flecha Incendiaria", "Fire Arrow", "Flèche enflammée", "Freccia di fuoco" },
};

const unk8* _806E774[5] = { "You got:", "Has conseguido:", "Du hast:", "Tu as:", "Hai ottenuto:" };

const unk8* _806E788[5] = { "Pause", "Pausa", "Pause", "En Pause", "Pausa" };

const unk8* _806E79C[5] = { "Retry?", "¿Reintentar?", "Nochmal?", "Réessayer?", "Riprova?" };

MenuItemDescriptor _806E7B0[] = {
    { { "Resume", "Continuar", "Weiter", "Reprendre", "Riprendi" }, 0, NULL, 0, 0 },
    { { "Exit", "Salir", "Beenden", "Quitter", "Esci" }, 0, NULL, 0, 2 },
    { { NULL } },
};

MenuItemDescriptor _806E810[] = {
    { { "Retry", "Reintentar", "Nochmal", "Réessayer", "Riprova" }, 0, NULL, 0, 0 },
    { { "Exit", "Salir", "Beenden", "Quitter", "Esci" }, 0, NULL, 0, 2 },
    { { NULL } },
};

MenuItemDescriptor _806E870[] = {
    { { "Please wait...", "Espera, por favor...", "Bitte warten...", "Un instant...",
          "Attendi..." },
        0, NULL, 0, 0 },
    { { NULL } },
};

const unk8* _806E8B0[5] = { "Name: ", "Nombre: ", "Name: ", "Nom: ", "Nome: " };

const unk8* _806E8C4[5] = { "Perfect!", "¡Perfecto!", "Perfekt!", "Parfait!", "Perfetto!" };

const unk8* _806E8D8[][5] = {
    { "Results:", "Resultados:", "Ergebnisse:", "Résultats:", "Risultati:" },
    { "Draws:", "Empates:", "Unentschieden:", "Matches nuls:", "Pareggi:" },
    { "Remaining:", "Restante:", "Verbleibend:", "Restant:", "Restanti:" },
};

const unk8* _806E914[][5] = {
    { "It's a draw!", "¡Es un empate!", "Unentschieden!", "Egalité!", "È un pareggio!" },
    { "You win!", "¡Tú ganas!", "Du hast gewonnen!", "Tu as gagné!", "Hai vinto!" },
    { "You lose!", "¡Tú pierdes!", "Du hast verloren!", "Tu as perdu!", "Hai perso!" },
};

FrontendSubobjectData _806E950 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Results", "Resultados", "Ergebnisse", "Résultats", "Risultati" }, 240, { 0 }, &_8068954,
    &_806897C };

const unk8* _806E97C[][5] = {
    { "Time:", "Tiempo:", "Zeit:", "Temps:", "Tempo:" },
    { "Best time: ", "Mejor tiempo: ", "Bestzeit: ", "Meil. temps: ", "Tempo migliore: " },
    { "Attempts:", "Intentos:", "Versuche:", "Tentatives:", "Tentativi:" },
    { "Items collected:", "Objetos recogidos:", "Eingesammelte Objekte:", "Objets ramassés:",
        "Oggetti raccolti:" },
    { "New best time!", "¡Nuevo mejor tiempo!", "Neue Bestzeit!", "Nouv. meil. temps!",
        "Nuovo tempo migliore!" },
    { "Round cleared!", "¡Ronda superada!", "Runde bestanden!", "Round réussi!",
        "Round superato!" },
    { "Round failed!", "¡Ronda no superada!", "Runde nicht bestanden!", "Round échoué!",
        "Round fallito!" },
    { "Par time: ", "Tiempo empatado: ", "Par-Zeit: ", "Temps prévu: ", "Tempo limite: " },
    { "Items: ", "Objetos: ", "Gegenstände: ", "Objets: ", "Oggetti: " },
};

FrontendSubobjectData _806EA30 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Results", "Resultados", "Ergebnisse", "Résultats", "Risultati" }, 240, { 0 }, &_8068954,
    &_806897C };

const unk8* _806EA5C[5] = { "Race", "Carrera", "Rennen", "Course", "Gara" };

const unk8* _806EA70[5] = { "Battle", "Batalla", "Kampf", "Combat", "Battaglia" };

FrontendSubobjectData _806EA84 = { 4, -32, 4, 4, &FontStyle_806890C,
    { "Controls", "Controles", "Steuerung", "Commandes", "Comandi" }, 240, { 0 }, &_8068954,
    &_806897C };

FrontendMenuItemData SubMenu_134671024[] = {
    { &SpriteSheet_82875D4,
        { "2D Control", "2D Controles", "2D Steuerung", "Commandes 2D", "2D Comandi" }, 0x2000,
        0x2000, 0x100, 0x136, 8, 0x1F },
    { &SpriteSheet_82875D4,
        { "3D Control", "3D Controles", "3D Steuerung", "Commandes 3D", "3D Comandi" }, 0x2000,
        0x2000, 0x100, 0x136, 7, 0x1E },
};

void turorial_804A488(unk32 arg0)
{
    s32 index;
    s32 count;
    LevelState* levelState;
    TutorialData* tutorial;
    TutorialEntry* entry;

    tutorial = &_gameData->tutorial;
    entry = tutorial->entries;
    levelState = sub_8051734();
    index = 0;
    if (entry->line - 1 != arg0) {
        count = tutorial->count;
        if (index < count) {
            do {
                index++;
                entry++;
            } while (entry->line - 1 != arg0 && index < count);
        }
    }
    if (index != tutorial->count && entry->line != 0) {
        if ((levelState->unk14[index >> 5] & (1 << (index & 0x1F))) == 0) {
            sub_80555F4();
            tutorial->unk104 = entry;
            levelState->unk14[index >> 5] |= 1 << (index & 0x1F);
        }
    }
}

unk32 sub_804A504(void)
{
    unk32 value;

    value = (unk32)_gameData->tutorial.unk104;
    return ((0 - value) | value) >> 31;
}

void sub_804A51C(void)
{
    GameData* data;
    TutorialEntry** slot;

    data = _gameData;
    slot = &data->tutorial.unk104;
    if (*slot != NULL && sub_80556DC(1) != 0) {
        sub_804A550(*slot);
        *slot = NULL;
        sub_8055624();
    }
}

void sub_804A550(TutorialEntry* arg0)
{
    GameData* gameData;
    TutorialData* tutorial;
    s32 timer;
    s32 index;
    unk32 done;
    unk32 counter;

    gameData = _gameData;
    tutorial = &gameData->tutorial;
    timer = 30;
    index = 0;
    done = 0;
    counter = 0;
    sub_8061660(&tutorial->fontData, arg0->sprite->languageStrings[0].strings[getLanguage()], 0xF);
    if (tutorial->unk13C == NULL) {
        tutorial->unk13C = allocSprite(0);
        if (tutorial->unk13C != NULL) {
            LoadSpriteSheet(tutorial->unk13C, &SpriteSheet_821CCC8, 0x200, 0x6600, 0, 0, 0, 0);
        }
    }
    while (done == 0) {
        VBlankIntrWait();
        sub_80627F0();
        updateKeyState();
        timer--;
        if (timer <= 0) {
            if (tutorial->unk138 == NULL) {
                tutorial->unk138 = allocSprite(0);
                if (tutorial->unk138 != NULL) {
                    LoadSpriteSheet(
                        tutorial->unk138, &SpriteSheet_821CB80, 0xDE00, 0x6E00, 0, 0, 0, 0);
                }
            }
            if ((_unk3005DA0 & 1) != 0 || timer < -200) {
                index++;
                timer = 15;
                if (index < arg0->sprite->languageCount[getLanguage()]) {
                    sub_8061660(&tutorial->fontData,
                        arg0->sprite->languageStrings[index].strings[getLanguage()], 0xF);
                } else {
                    done = 1;
                }
                if (tutorial->unk138 != NULL) {
                    sub_8060A94(tutorial->unk138);
                    tutorial->unk138 = NULL;
                }
            }
        }
        if (tutorial->unk138 != NULL && (counter & 0xF) == 0) {
            unk16 frame;

            frame = 0;
            if (tutorial->unk138->frame == 0) {
                frame = 1;
            }
            tutorial->unk138->frame = frame;
        }
        if ((_unk3005DA0 & 8) != 0) {
            done = 1;
        }
        __oam_8756CC0();
        counter++;
    }
    if (tutorial->unk138 != NULL) {
        sub_8060A94(tutorial->unk138);
        tutorial->unk138 = NULL;
    }
    if (tutorial->unk13C != NULL) {
        sub_8060A94(tutorial->unk13C);
        tutorial->unk13C = NULL;
    }
    sub_8061228(&tutorial->fontData);
}

void sub_804A72C(void)
{
    _gameData->tutorial.count = 0;
}

unk32 unref_804A744(BackgroundAsset* arg0, unk8 arg1, unk8 arg2, FontStyle* arg3)
{
    unk16* dest;
    unk16 value;
    s32 i;

    value = arg3->unkA << 12;
    unref_8058C74(&arg0->layer, arg1, 0x400, 0);
    sub_805B244(&arg0->renderer, &arg0->layer, arg3->unk0, arg3->unk4, arg3->unkA);
    dest = (unk16*)(VRAM + (arg0->layer.screenBaseBlock << 11));
    for (i = 0; i <= 0x3FF; i++) {
        *dest = (i & 0x3FF) | value;
        dest++;
    }
    __fastMemoryClearARM(
        0, (void*)(VRAM + (arg0->renderer.layer->characterBaseBlock << 14)), 0x8000);
    sub_8059CC8(arg1, arg2);
    ToggleLayerVisibility(arg1, 1);
}

void sub_804A7E8(BGLayer* arg0)
{
    ToggleLayerVisibility(arg0->layerIndex, 0);
}

void sub_804A7F8(BackgroundAsset* arg0)
{
    __fastMemoryClearARM(
        0, (void*)(VRAM + (arg0->renderer.layer->characterBaseBlock << 14)), 0x8000);
}

void nullsub_32(void)
{
}

void sub_804A824(FrontendState* arg0, unk32 arg1, unk32 arg2)
{
    arg0->unk9C += arg2;
}

void sub_804A830(FrontendState* arg0, unk32 arg1, unk32 arg2)
{
    arg0->unk9C = arg2;
}

ASM_ZEROPAD
