#include "items.h"

#include "language.h"
#include "ram.h"

extern const unk8 Pal_836067C[];
extern unk8 SpriteSheet_836087C[];
extern unk8 SpriteSheet_8330070[];
extern unk8 SpriteSheet_83305DC[];
extern unk8 SpriteSheet_8330AB8[];
extern unk8 SpriteSheet_8330FC0[];
extern unk8 SpriteSheet_8331504[];
extern unk8 SpriteSheet_83319EC[];
extern unk8 SpriteSheet_8331EBC[];
extern unk8 SpriteSheet_8332344[];
extern unk8 SpriteSheet_833285C[];
extern unk8 SpriteSheet_8332E10[];
extern unk8 SpriteSheet_83332F4[];
extern unk8 SpriteSheet_83337C8[];
extern unk8 SpriteSheet_8333D28[];
extern unk8 SpriteSheet_833425C[];
extern unk8 SpriteSheet_833483C[];
extern unk8 SpriteSheet_8334E58[];
extern unk8 SpriteSheet_8335364[];
extern unk8 SpriteSheet_8335854[];
extern unk8 SpriteSheet_8335E4C[];
extern unk8 SpriteSheet_8336394[];
extern unk8 SpriteSheet_83367D0[];
extern unk8 SpriteSheet_8336BF4[];
extern unk8 SpriteSheet_8337104[];
extern unk8 SpriteSheet_8337708[];
extern unk8 SpriteSheet_8337BF0[];
extern unk8 SpriteSheet_833812C[];
extern unk8 SpriteSheet_83386B4[];
extern unk8 SpriteSheet_8338C5C[];
extern unk8 SpriteSheet_833916C[];
extern unk8 SpriteSheet_833973C[];
extern unk8 SpriteSheet_8339C44[];
extern unk8 SpriteSheet_833A120[];
extern unk8 SpriteSheet_833A7C8[];
extern unk8 SpriteSheet_833AE30[];
extern unk8 SpriteSheet_833B44C[];
extern unk8 SpriteSheet_833B974[];
extern unk8 SpriteSheet_833BF64[];
extern unk8 SpriteSheet_833C418[];
extern unk8 SpriteSheet_833C968[];
extern unk8 SpriteSheet_833CF10[];
extern unk8 SpriteSheet_833D474[];
extern unk8 SpriteSheet_833DA1C[];
extern unk8 SpriteSheet_833DFD4[];
extern unk8 SpriteSheet_833E65C[];
extern unk8 SpriteSheet_833EC5C[];
extern unk8 SpriteSheet_833F214[];
extern unk8 SpriteSheet_833F69C[];
extern unk8 SpriteSheet_833FBE8[];
extern unk8 SpriteSheet_8340180[];
extern unk8 SpriteSheet_83406BC[];
extern unk8 SpriteSheet_8340C60[];
extern unk8 SpriteSheet_834118C[];
extern unk8 SpriteSheet_83417B8[];
extern unk8 SpriteSheet_8341DAC[];
extern unk8 SpriteSheet_8342404[];
extern unk8 SpriteSheet_834298C[];
extern unk8 SpriteSheet_8342EA0[];
extern unk8 SpriteSheet_8343370[];
extern unk8 SpriteSheet_83438F0[];
extern unk8 SpriteSheet_8343E80[];
extern unk8 SpriteSheet_83443A0[];
extern unk8 SpriteSheet_834477C[];
extern unk8 SpriteSheet_8344AB4[];
extern unk8 SpriteSheet_8344F94[];
extern unk8 SpriteSheet_834545C[];
extern unk8 SpriteSheet_8345884[];
extern unk8 SpriteSheet_8345D00[];
extern unk8 SpriteSheet_8346324[];
extern unk8 SpriteSheet_8346764[];
extern unk8 SpriteSheet_8346C9C[];
extern unk8 SpriteSheet_834715C[];
extern unk8 SpriteSheet_8347654[];
extern unk8 SpriteSheet_8347AFC[];
extern unk8 SpriteSheet_8347F34[];
extern unk8 SpriteSheet_83484F4[];
extern unk8 SpriteSheet_83489DC[];
extern unk8 SpriteSheet_8348F30[];
extern unk8 SpriteSheet_834958C[];
extern unk8 SpriteSheet_8349AA4[];
extern unk8 SpriteSheet_834A09C[];
extern unk8 SpriteSheet_834A4D0[];
extern unk8 SpriteSheet_834A9A0[];
extern unk8 SpriteSheet_834AE2C[];
extern unk8 SpriteSheet_834B30C[];
extern unk8 SpriteSheet_834B7D8[];
extern unk8 SpriteSheet_834BC4C[];
extern unk8 SpriteSheet_834BFEC[];
extern unk8 SpriteSheet_834C49C[];
extern unk8 SpriteSheet_834CA14[];
extern unk8 SpriteSheet_834CEB0[];
extern unk8 SpriteSheet_834D3CC[];
extern unk8 SpriteSheet_834D88C[];
extern unk8 SpriteSheet_834DD5C[];
extern unk8 SpriteSheet_834E27C[];
extern unk8 SpriteSheet_834E6F4[];
extern unk8 SpriteSheet_834EC5C[];
extern unk8 SpriteSheet_834F024[];
extern unk8 SpriteSheet_834F4E8[];
extern unk8 SpriteSheet_834F8E4[];
extern unk8 SpriteSheet_834FDB4[];
extern unk8 SpriteSheet_8350234[];
extern unk8 SpriteSheet_8350714[];
extern unk8 SpriteSheet_8350C34[];
extern unk8 SpriteSheet_83510B4[];
extern unk8 SpriteSheet_83515E8[];
extern unk8 SpriteSheet_8351B70[];
extern unk8 SpriteSheet_83520B8[];
extern unk8 SpriteSheet_83525FC[];
extern unk8 SpriteSheet_8352834[];
extern const unk8 Pal_8352C7C[];
extern const unk8 Pal_8352E7C[];
extern const unk8 Pal_835307C[];
extern const unk8 Pal_835327C[];
extern const unk8 Pal_835347C[];
extern const unk8 Pal_835367C[];
extern const unk8 Pal_835387C[];
extern const unk8 Pal_8353A7C[];
extern const unk8 Pal_8353C7C[];
extern const unk8 Pal_8353E7C[];
extern const unk8 Pal_835407C[];
extern const unk8 Pal_835427C[];
extern const unk8 Pal_835447C[];
extern const unk8 Pal_835467C[];
extern const unk8 Pal_835487C[];
extern const unk8 Pal_8354A7C[];
extern const unk8 Pal_8354C7C[];
extern const unk8 Pal_8354E7C[];
extern const unk8 Pal_835507C[];
extern const unk8 Pal_835527C[];
extern const unk8 Pal_835547C[];
extern const unk8 Pal_835567C[];
extern const unk8 Pal_835587C[];
extern const unk8 Pal_8355A7C[];
extern const unk8 Pal_8355C7C[];
extern const unk8 Pal_8355E7C[];
extern const unk8 Pal_835607C[];
extern const unk8 Pal_835627C[];
extern const unk8 Pal_835647C[];
extern const unk8 Pal_835667C[];
extern const unk8 Pal_835687C[];
extern const unk8 Pal_8356A7C[];
extern const unk8 Pal_8356C7C[];
extern const unk8 Pal_8356E7C[];
extern const unk8 Pal_835707C[];
extern const unk8 Pal_835727C[];
extern const unk8 Pal_835747C[];
extern const unk8 Pal_835767C[];
extern const unk8 Pal_835787C[];
extern const unk8 Pal_8357A7C[];
extern const unk8 Pal_8357C7C[];
extern const unk8 Pal_8357E7C[];
extern const unk8 Pal_835807C[];
extern const unk8 Pal_835827C[];
extern const unk8 Pal_835847C[];
extern const unk8 Pal_835867C[];
extern const unk8 Pal_835887C[];
extern const unk8 Pal_8358A7C[];
extern const unk8 Pal_8358C7C[];
extern const unk8 Pal_8358E7C[];
extern const unk8 Pal_835907C[];
extern const unk8 Pal_835927C[];
extern const unk8 Pal_835947C[];
extern const unk8 Pal_835967C[];
extern const unk8 Pal_835987C[];
extern const unk8 Pal_8359A7C[];
extern const unk8 Pal_8359C7C[];
extern const unk8 Pal_8359E7C[];
extern const unk8 Pal_835A07C[];
extern const unk8 Pal_835A27C[];
extern const unk8 Pal_835A47C[];
extern const unk8 Pal_835A67C[];
extern const unk8 Pal_835A87C[];
extern const unk8 Pal_835AA7C[];
extern const unk8 Pal_835AC7C[];
extern const unk8 Pal_835AE7C[];
extern const unk8 Pal_835B07C[];
extern const unk8 Pal_835B27C[];
extern const unk8 Pal_835B47C[];
extern const unk8 Pal_835B67C[];
extern const unk8 Pal_835B87C[];
extern const unk8 Pal_835BA7C[];
extern const unk8 Pal_835BC7C[];
extern const unk8 Pal_835BE7C[];
extern const unk8 Pal_835C07C[];
extern const unk8 Pal_835C27C[];
extern const unk8 Pal_835C47C[];
extern const unk8 Pal_835C67C[];
extern const unk8 Pal_835C87C[];
extern const unk8 Pal_835CA7C[];
extern const unk8 Pal_835CC7C[];
extern const unk8 Pal_835CE7C[];
extern const unk8 Pal_835D07C[];
extern const unk8 Pal_835D27C[];
extern const unk8 Pal_835D47C[];
extern const unk8 Pal_835D67C[];
extern const unk8 Pal_835D87C[];
extern const unk8 Pal_835DA7C[];
extern const unk8 Pal_835DC7C[];
extern const unk8 Pal_835DE7C[];
extern const unk8 Pal_835E07C[];
extern const unk8 Pal_835E27C[];
extern const unk8 Pal_835E47C[];
extern const unk8 Pal_835E67C[];
extern const unk8 Pal_835E87C[];
extern const unk8 Pal_835EA7C[];
extern const unk8 Pal_835EC7C[];
extern const unk8 Pal_835EE7C[];
extern const unk8 Pal_835F07C[];
extern const unk8 Pal_835F27C[];
extern const unk8 Pal_835F47C[];
extern const unk8 Pal_835F67C[];
extern const unk8 Pal_835F87C[];
extern const unk8 Pal_835FA7C[];
extern const unk8 Pal_835FC7C[];
extern const unk8 Pal_835FE7C[];
extern const unk8 Pal_836007C[];
extern const unk8 Pal_836027C[];
extern const unk8 Pal_836047C[];
extern const SpriteSheet SpriteSheet_82CBA28;
extern const unk16 Pal_82CD048[];
extern const SpriteSheet SpriteSheet_82CD248;
extern const unk16 Pal_82CE7A8[];
extern const SpriteSheet SpriteSheet_82CE9A8;
extern const unk16 Pal_82CFD88[];
extern const SpriteSheet SpriteSheet_82CFF88;
extern const unk16 Pal_82D1488[];
extern const SpriteSheet SpriteSheet_82D1688;
extern const SpriteSheet SpriteSheet_82D2D88;
extern const unk16 Pal_82D2B88[];
extern const unk16 Pal_82D4288[];
extern const SpriteSheet SpriteSheet_82D4488;
extern const unk16 Pal_82D5AA8[];
extern const SpriteSheet SpriteSheet_82D5CA8;
extern const SpriteSheet SpriteSheet_82D7408;
extern const unk16 Pal_82D7208[];
extern const unk16 Pal_82D8968[];
extern const SpriteSheet SpriteSheet_82D8B68;
extern const unk16 Pal_82DA068[];
extern const SpriteSheet SpriteSheet_82DA268;
extern const unk16 Pal_82DB7C8[];
extern const SpriteSheet SpriteSheet_82DB9C8;
extern const SpriteSheet SpriteSheet_82DD0C8;
extern const unk16 Pal_82DCEC8[];
extern const unk16 Pal_82DE5C8[];
extern const SpriteSheet SpriteSheet_82DE7C8;
extern const unk16 Pal_82DF9C8[];
extern const SpriteSheet SpriteSheet_82DFBC8;
extern const unk16 Pal_82E1078[];
extern const SpriteSheet SpriteSheet_82E1278;
extern const unk16 Pal_82E28F8[];
extern const SpriteSheet SpriteSheet_82E2AF8;
extern const unk16 Pal_82E4178[];
extern const SpriteSheet SpriteSheet_82E4378;
extern const unk16 Pal_82E56F8[];
extern const SpriteSheet SpriteSheet_82E58F8;
extern const SpriteSheet SpriteSheet_82E6C38;
extern const unk16 Pal_82E6A38[];
extern const unk16 Pal_82E7D78[];
extern const SpriteSheet SpriteSheet_82E7F78;
extern const unk16 Pal_82E9298[];
extern const SpriteSheet SpriteSheet_82E9498;
extern const unk16 Pal_82EA998[];
extern const SpriteSheet SpriteSheet_82EAB98;
extern const unk16 Pal_82EC2D8[];
extern const SpriteSheet SpriteSheet_82EC4D8;
extern const unk16 Pal_82EDB58[];
extern const SpriteSheet SpriteSheet_82EDD58;
extern const SpriteSheet SpriteSheet_82EF458;
extern const unk16 Pal_82EF258[];
extern const unk16 Pal_82F0958[];
extern const SpriteSheet SpriteSheet_82F0B58;
extern const unk16 Pal_82F1E78[];
extern const SpriteSheet SpriteSheet_82F2078;
extern const unk16 Pal_82F3638[];
extern const SpriteSheet SpriteSheet_82F3838;
extern const unk16 Pal_82F46D8[];
extern const SpriteSheet SpriteSheet_82F48D8;
extern const unk16 Pal_82F58F8[];
extern const SpriteSheet SpriteSheet_82F5AF8;
extern const unk16 Pal_82F6ED8[];
extern const SpriteSheet SpriteSheet_82F70D8;
extern const unk16 Pal_82F7B78[];
extern const SpriteSheet SpriteSheet_82F7D78;
extern const unk16 Pal_82F92D8[];
extern const SpriteSheet SpriteSheet_82F94D8;
extern const unk16 Pal_82FABB8[];

ItemDescriptionEntry ItemDescription[] = {
    { { "item Desc 0", "item Desc 0 (spa)", "item Desc 0 (deu)", "item Desc 0 (fre)",
          "item Desc 0 (ita)" },
        0 },
    { { "item Desc 1", "item Desc 1 (spa)", "item Desc 1 (deu)", "item Desc 1 (fre)",
          "item Desc 1 (ita)" },
        0 },
    { { "item Desc 2", "item Desc 2 (spa)", "item Desc 2 (deu)", "item Desc 2 (fre)",
          "item Desc 2 (ita)" },
        0 },
    { { "item Desc 3", "item Desc 3 (spa)", "item Desc 3 (deu)", "item Desc 3 (fre)",
          "item Desc 3 (ita)" },
        0 },
    { { "item Desc 4", "item Desc 4 (spa)", "item Desc 4 (deu)", "item Desc 4 (fre)",
          "item Desc 4 (ita)" },
        0 },
    { { "item Desc 5", "item Desc 5 (spa)", "item Desc 5 (deu)", "item Desc 5 (fre)",
          "item Desc 5 (ita)" },
        0 },
    { { "item Desc 6", "item Desc 6 (spa)", "item Desc 6 (deu)", "item Desc 6 (fre)",
          "item Desc 6 (ita)" },
        0 },
    { { "item Desc 7", "item Desc 7 (spa)", "item Desc 7 (deu)", "item Desc 7 (fre)",
          "item Desc 7 (ita)" },
        0 },
    { { "item Desc 8", "item Desc 8 (spa)", "item Desc 8 (deu)", "item Desc 8 (fre)",
          "item Desc 8 (ita)" },
        0 },
    { { "item Desc 9", "item Desc 9 (spa)", "item Desc 9 (deu)", "item Desc 9 (fre)",
          "item Desc 9 (ita)" },
        0 },
    { { "item Desc 10", "item Desc 10 (spa)", "item Desc 10 (deu)", "item Desc 10 (fre)",
          "item Desc 10 (ita)" },
        2 },
    { { "item Desc 11", "item Desc 11 (spa)", "item Desc 11 (deu)", "item Desc 11 (fre)",
          "item Desc 11 (ita)" },
        0 },
    { { "item Desc 12", "item Desc 12 (spa)", "item Desc 12 (deu)", "item Desc 12 (fre)",
          "item Desc 12 (ita)" },
        0 },
    { { "item Desc 13", "item Desc 13 (spa)", "item Desc 13 (deu)", "item Desc 13 (fre)",
          "item Desc 13 (ita)" },
        0 },
    { { "item Desc 14", "item Desc 14 (spa)", "item Desc 14 (deu)", "item Desc 14 (fre)",
          "item Desc 14 (ita)" },
        0 },
    { { "item Desc 15", "item Desc 15 (spa)", "item Desc 15 (deu)", "item Desc 15 (fre)",
          "item Desc 15 (ita)" },
        0 },
    { { "item Desc 16", "item Desc 16 (spa)", "item Desc 16 (deu)", "item Desc 16 (fre)",
          "item Desc 16 (ita)" },
        0 },
    { { "item Desc 17", "item Desc 17 (spa)", "item Desc 17 (deu)", "item Desc 17 (fre)",
          "item Desc 17 (ita)" },
        0 },
    { { "item Desc 18", "item Desc 18 (spa)", "item Desc 18 (deu)", "item Desc 18 (fre)",
          "item Desc 18 (ita)" },
        0 },
    { { "item Desc 19", "item Desc 19 (spa)", "item Desc 19 (deu)", "item Desc 19 (fre)",
          "item Desc 19 (ita)" },
        0 },
    { { "item Desc 20", "item Desc 20 (spa)", "item Desc 20 (deu)", "item Desc 20 (fre)",
          "item Desc 20 (ita)" },
        2 },
    { { "item Desc 21", "item Desc 21 (spa)", "item Desc 21 (deu)", "item Desc 21 (fre)",
          "item Desc 21 (ita)" },
        0 },
    { { "item Desc 22", "item Desc 22 (spa)", "item Desc 22 (deu)", "item Desc 22 (fre)",
          "item Desc 22 (ita)" },
        0 },
    { { "item Desc 23", "item Desc 23 (spa)", "item Desc 23 (deu)", "item Desc 23 (fre)",
          "item Desc 23 (ita)" },
        0 },
    { { "item Desc 24", "item Desc 24 (spa)", "item Desc 24 (deu)", "item Desc 24 (fre)",
          "item Desc 24 (ita)" },
        0 },
    { { "item Desc 25", "item Desc 25 (spa)", "item Desc 25 (deu)", "item Desc 25 (fre)",
          "item Desc 25 (ita)" },
        0 },
    { { "item Desc 26", "item Desc 26 (spa)", "item Desc 26 (deu)", "item Desc 26 (fre)",
          "item Desc 26 (ita)" },
        0 },
    { { "item Desc 27", "item Desc 27 (spa)", "item Desc 27 (deu)", "item Desc 27 (fre)",
          "item Desc 27 (ita)" },
        0 },
    { { "item Desc 28", "item Desc 28 (spa)", "item Desc 28 (deu)", "item Desc 28 (fre)",
          "item Desc 28 (ita)" },
        0 },
    { { "item Desc 29", "item Desc 29 (spa)", "item Desc 29 (deu)", "item Desc 29 (fre)",
          "item Desc 29 (ita)" },
        0 },
    { { "item Desc 30", "item Desc 30 (spa)", "item Desc 30 (deu)", "item Desc 30 (fre)",
          "item Desc 30 (ita)" },
        1 },
    { { "item Desc 31", "item Desc 31 (spa)", "item Desc 31 (deu)", "item description 31 (fre)",
          "item description 31 (ita)" },
        1 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
    { { NULL, NULL, NULL, NULL, NULL }, 0 },
};

unk8* CollectionSpriteSheets[] = {
    SpriteSheet_8330070,
    SpriteSheet_83305DC,
    SpriteSheet_8330AB8,
    SpriteSheet_8330FC0,
    SpriteSheet_8331504,
    SpriteSheet_83319EC,
    SpriteSheet_8331EBC,
    SpriteSheet_8332344,
    SpriteSheet_833285C,
    SpriteSheet_8332E10,
    SpriteSheet_83332F4,
    SpriteSheet_83337C8,
    SpriteSheet_8333D28,
    SpriteSheet_833425C,
    SpriteSheet_833483C,
    SpriteSheet_8334E58,
    SpriteSheet_8335364,
    SpriteSheet_8335854,
    SpriteSheet_8335E4C,
    SpriteSheet_8336394,
    SpriteSheet_83367D0,
    SpriteSheet_8336BF4,
    SpriteSheet_8337104,
    SpriteSheet_8337708,
    SpriteSheet_8337BF0,
    SpriteSheet_833812C,
    SpriteSheet_83386B4,
    SpriteSheet_8338C5C,
    SpriteSheet_833916C,
    SpriteSheet_833973C,
    SpriteSheet_8339C44,
    SpriteSheet_833A120,
    SpriteSheet_833A7C8,
    SpriteSheet_833AE30,
    SpriteSheet_833B44C,
    SpriteSheet_833B974,
    SpriteSheet_833BF64,
    SpriteSheet_833C418,
    SpriteSheet_833C968,
    SpriteSheet_833CF10,
    SpriteSheet_833D474,
    SpriteSheet_833DA1C,
    SpriteSheet_833DFD4,
    SpriteSheet_833E65C,
    SpriteSheet_833EC5C,
    SpriteSheet_833F214,
    SpriteSheet_833F69C,
    SpriteSheet_833FBE8,
    SpriteSheet_8340180,
    SpriteSheet_83406BC,
    SpriteSheet_8340C60,
    SpriteSheet_834118C,
    SpriteSheet_83417B8,
    SpriteSheet_8341DAC,
    SpriteSheet_8342404,
    SpriteSheet_834298C,
    SpriteSheet_8342EA0,
    SpriteSheet_8343370,
    SpriteSheet_83438F0,
    SpriteSheet_8343E80,
    SpriteSheet_83443A0,
    SpriteSheet_834477C,
    SpriteSheet_8344AB4,
    SpriteSheet_8344F94,
    SpriteSheet_834545C,
    SpriteSheet_8345884,
    SpriteSheet_8345D00,
    SpriteSheet_8346324,
    SpriteSheet_8346764,
    SpriteSheet_8346C9C,
    SpriteSheet_834715C,
    SpriteSheet_8347654,
    SpriteSheet_8347AFC,
    SpriteSheet_8347F34,
    SpriteSheet_83484F4,
    SpriteSheet_83489DC,
    SpriteSheet_8348F30,
    SpriteSheet_834958C,
    SpriteSheet_8349AA4,
    SpriteSheet_834A09C,
    SpriteSheet_834A4D0,
    SpriteSheet_834A9A0,
    SpriteSheet_834AE2C,
    SpriteSheet_834B30C,
    SpriteSheet_834B7D8,
    SpriteSheet_834BC4C,
    SpriteSheet_834BFEC,
    SpriteSheet_834C49C,
    SpriteSheet_834CA14,
    SpriteSheet_834CEB0,
    SpriteSheet_834D3CC,
    SpriteSheet_834D88C,
    SpriteSheet_834DD5C,
    SpriteSheet_834E27C,
    SpriteSheet_834E6F4,
    SpriteSheet_834EC5C,
    SpriteSheet_834F024,
    SpriteSheet_834F4E8,
    SpriteSheet_834F8E4,
    SpriteSheet_834FDB4,
    SpriteSheet_8350234,
    SpriteSheet_8350714,
    SpriteSheet_8350C34,
    SpriteSheet_83510B4,
    SpriteSheet_83515E8,
    SpriteSheet_8351B70,
    SpriteSheet_83520B8,
    SpriteSheet_83525FC,
    SpriteSheet_8352834,
};

const unk8* CollectionPalettes[] = {
    Pal_8352C7C,
    Pal_8352E7C,
    Pal_835307C,
    Pal_835327C,
    Pal_835347C,
    Pal_835367C,
    Pal_835387C,
    Pal_8353A7C,
    Pal_8353C7C,
    Pal_8353E7C,
    Pal_835407C,
    Pal_835427C,
    Pal_835447C,
    Pal_835467C,
    Pal_835487C,
    Pal_8354A7C,
    Pal_8354C7C,
    Pal_8354E7C,
    Pal_835507C,
    Pal_835527C,
    Pal_835547C,
    Pal_835567C,
    Pal_835587C,
    Pal_8355A7C,
    Pal_8355C7C,
    Pal_8355E7C,
    Pal_835607C,
    Pal_835627C,
    Pal_835647C,
    Pal_835667C,
    Pal_835687C,
    Pal_8356A7C,
    Pal_8356C7C,
    Pal_8356E7C,
    Pal_835707C,
    Pal_835727C,
    Pal_835747C,
    Pal_835767C,
    Pal_835787C,
    Pal_8357A7C,
    Pal_8357C7C,
    Pal_8357E7C,
    Pal_835807C,
    Pal_835827C,
    Pal_835847C,
    Pal_835867C,
    Pal_835887C,
    Pal_8358A7C,
    Pal_8358C7C,
    Pal_8358E7C,
    Pal_835907C,
    Pal_835927C,
    Pal_835947C,
    Pal_835967C,
    Pal_835987C,
    Pal_8359A7C,
    Pal_8359C7C,
    Pal_8359E7C,
    Pal_835A07C,
    Pal_835A27C,
    Pal_835A47C,
    Pal_835A67C,
    Pal_835A87C,
    Pal_835AA7C,
    Pal_835AC7C,
    Pal_835AE7C,
    Pal_835B07C,
    Pal_835B27C,
    Pal_835B47C,
    Pal_835B67C,
    Pal_835B87C,
    Pal_835BA7C,
    Pal_835BC7C,
    Pal_835BE7C,
    Pal_835C07C,
    Pal_835C27C,
    Pal_835C47C,
    Pal_835C67C,
    Pal_835C87C,
    Pal_835CA7C,
    Pal_835CC7C,
    Pal_835CE7C,
    Pal_835D07C,
    Pal_835D27C,
    Pal_835D47C,
    Pal_835D67C,
    Pal_835D87C,
    Pal_835DA7C,
    Pal_835DC7C,
    Pal_835DE7C,
    Pal_835E07C,
    Pal_835E27C,
    Pal_835E47C,
    Pal_835E67C,
    Pal_835E87C,
    Pal_835EA7C,
    Pal_835EC7C,
    Pal_835EE7C,
    Pal_835F07C,
    Pal_835F27C,
    Pal_835F47C,
    Pal_835F67C,
    Pal_835F87C,
    Pal_835FA7C,
    Pal_835FC7C,
    Pal_835FE7C,
    Pal_836007C,
    Pal_836027C,
    Pal_836047C,
};

static const unk8* _8079CB8[] = {
    "Ultimate Dragoon",
    "Ultimate Saizo",
    "Ultimate Frostic Dranzer",
    "Gekiryu-oh",
    "Megaro Arm",
    "Spark Knight",
    "Polta",
    "Pistol",
    "Makendo",
    "Bakushin-oh",
    "Bump King",
    "Grip Attacker",
    "Bearing Stinger",
    "Bound Attacker",
    "Bound Defender",
    "Roller Attacker",
    "Roller Defenser",
    "Auto Change Balancer",
    "Wing Attacker",
    "Wing Defenser",
    "Draciel Metal",
    "Dragoon Storm",
    "Driger S",
    "Death Driger",
    "Knight Dranzer",
    "Metal Draciel",
    "Kid Dragoon",
    "Dragoon S",
    "Dranzer S",
    "Galeon Attacker",
    "Galzzly",
    "Galman",
    "Wolborg",
    "Seaborg",
    "Draciel S",
    "Trygle",
    "Trypio",
    "Driger F",
    "Dragoon Fighter",
    "Dranzer F",
    "Griffolyon",
    "Master Dragoon",
    "Master Dranzer",
    "Master Draciel",
    "Draciel F",
    "Wyborg",
    "Master Driger",
    "Wolborg 2",
    "Dragoon V",
    "Metal Dranzer",
    "Flash Leopard",
    "Driger V",
    "Dranzer V",
    "Cyber Dragoon",
    "Draciel V",
    "Hayate Hidden Spirit",
    "Zinrai Hidden Spirit",
    "Cyber Dranzer",
    "Cyber Draciel",
    "Cyber Driger",
    "Fox",
    "Spider",
    "Sickle Weasel",
    "Tyranno",
    "Clarken",
    "Dragoon",
    "Dranzer",
    "Draciel",
    "Driger",
    "Cereberus",
    "Orthrus",
    "Gabriel",
    "Ariel",
    "Cyber Dragoon",
    "Cyber Driger",
    "Cyber Dranzer",
    "Cyber Draciel",
    "Flash Leopard",
    "Vortex Ape",
    "Sharkrash",
    "Vanishing Moot",
    "Bat",
    "Bus Driver",
    "Chameleon",
    "Daryl",
    "Dizzi",
    "Doctor B",
    "Dunga",
    "Figel",
    "Goki",
    "Gerry",
    "Grandpa",
    "Gideon",
    "Hilary",
    "Jim",
    "Joseph",
    "Kane",
    "Kai",
    "Kenny ",
    "Mariam",
    "Max",
    "Men in Black",
    "Mr. Dickenson",
    "Ozuma/Mister X",
    "Ray",
    "Salima",
    "Snakey",
    "The Robot",
    "Tyson",
};

static const unk8* _8079E6C[] = {
    "Dragón Definitivo",
    "Saizo Definitivo",
    "Dranzer Helado Definitivo",
    "Gekiryu-oh",
    "Brazo Megaro",
    "Caballero de las Chispas",
    "Polta",
    "Pistola",
    "Makendo",
    "Bakushin-oh",
    "Rey de los Choques",
    "Atacante de agarre",
    "Engranaje Aguijón",
    "Atacante de Rebote",
    "Defensor de Rebote",
    "Rodillo de Ataque",
    "Rodillo Defensivo",
    "Equilibrador de Autocambio",
    "Alas de Ataque",
    "Alas Defensivas",
    "Metálica de Draciel",
    "Tormenta Dragón",
    "Driger S",
    "Driger Mortal",
    "Caballero Dranzer",
    "Draciel Metálico",
    "Niño Dragoon",
    "Dragón S",
    "Dranzer S",
    "Galeón Ofensivo",
    "Galzzly",
    "Galman",
    "Wolborg",
    "Seaborg",
    "Draciel S",
    "Trygle",
    "Trypio",
    "Driger F",
    "Guerrero Dragón",
    "Dranzer F",
    "Griffolyon",
    "Maestro Dragón",
    "Maestro Dranzer",
    "Maestro Draciel",
    "Draciel F",
    "Wyborg",
    "Mestro Driger",
    "Wolborg 2",
    "Dragón V",
    "Dranzer Metálico",
    "Leopardo Relámpago",
    "Driger V",
    "Dranzer V",
    "Cíber Dragón",
    "Draciel V",
    "Espíritu Oculto Hayate",
    "Espíritu Oculto Zinrai",
    "Cíber Dranzer",
    "Cíber Draciel",
    "Cíber Driger",
    "Fox",
    "Spider",
    "Sickle Weasel",
    "Tyranno",
    "Clarken",
    "Dragoon",
    "Dranzer",
    "Draciel",
    "Driger",
    "Cereberus",
    "Orthrus",
    "Gabriel",
    "Ariel",
    "Cyber Dragoon",
    "Cyber Driger",
    "Cyber Dranzer",
    "Cyber Draciel",
    "Flash Leopard",
    "Vortex Ape",
    "Sharkrash",
    "Vanishing Moot",
    "Bat",
    "Bus Driver",
    "Chameleon",
    "Daryl",
    "Dizzi",
    "Doctor B",
    "Dunga",
    "Figel",
    "Goki",
    "Gerry",
    "Grandpa",
    "Gideon",
    "Hilary",
    "Jim",
    "Joseph",
    "Kane",
    "Kai",
    "Kenny ",
    "Mariam",
    "Max",
    "Men in Black",
    "Mr. Dickenson",
    "Ozuma/Mister X",
    "Ray",
    "Salima",
    "Snakey",
    "The Robot",
    "Tyson",
};

static const unk8* _807A020[] = {
    "Ultimate Dragoon",
    "Ultimate Saizo",
    "Ultimate Frostic Dranzer",
    "Gekiryu-oh",
    "Megaro Arm",
    "Spark Knight",
    "Polta",
    "Pistol",
    "Makendo",
    "Bakushin-oh",
    "Bump King",
    "Grip Attacker",
    "Bearing Stinger",
    "Bound Attacker",
    "Bound Defender",
    "Roller Attacker",
    "Roller Defenser",
    "Auto Change Balancer",
    "Wing Attacker",
    "Wing Defenser",
    "Draciel Metal",
    "Dragoon Storm",
    "Driger S",
    "Death Driger",
    "Knight Dranzer",
    "Metal Draciel",
    "Kid Dragoon",
    "Dragoon S",
    "Dranzer S",
    "Galeon Attacker",
    "Galzzly",
    "Galman",
    "Wolborg",
    "Seaborg",
    "Draciel S",
    "Trygle",
    "Trypio",
    "Driger F",
    "Dragoon Fighter",
    "Dranzer F",
    "Griffolyon",
    "Master Dragoon",
    "Master Dranzer",
    "Master Draciel",
    "Draciel F",
    "Wyborg",
    "Master Driger",
    "Wolborg 2",
    "Dragoon V",
    "Metal Dranzer",
    "Flash Leopard",
    "Driger V",
    "Dranzer V",
    "Cyber Dragoon",
    "Draciel V",
    "Hayate Hidden Spirit",
    "Zinrai Hidden Spirit",
    "Cyber Dranzer",
    "Cyber Draciel",
    "Cyber Driger",
    "Fox",
    "Spider",
    "Sickle Weasel",
    "Tyranno",
    "Clarken",
    "Dragoon",
    "Dranzer",
    "Draciel",
    "Driger",
    "Cereberus",
    "Orthrus",
    "Gabriel",
    "Ariel",
    "Cyber Dragoon",
    "Cyber Driger",
    "Cyber Dranzer",
    "Cyber Draciel",
    "Flash Leopard",
    "Vortex Ape",
    "Sharkrash",
    "Vanishing Moot",
    "Bat",
    "Bus Driver",
    "Chameleon",
    "Daryl",
    "Dizzi",
    "Doctor B",
    "Dunga",
    "Figel",
    "Goki",
    "Gerry",
    "Grandpa",
    "Gideon",
    "Hilary",
    "Jim",
    "Joseph",
    "Kane",
    "Kai",
    "Kenny ",
    "Mariam",
    "Max",
    "Men in Black",
    "Mr. Dickenson",
    "Ozuma/Mister X",
    "Ray",
    "Salima",
    "Snakey",
    "The Robot",
    "Tyson",
};

static const unk8* _807A1D4[] = {
    "Ultimate Dragoon",
    "Ultimate Saizo",
    "Ultimate Frostic Dranzer",
    "Gekiryu-oh",
    "Megaro Arm",
    "Spark Knight",
    "Polta",
    "Pistol",
    "Makendoh",
    "Bakushin-oh",
    "Bump King",
    "Grip Attacker",
    "Bearing Stinger",
    "Bound Attacker",
    "Bound Defender",
    "Roller Attacker",
    "Roller Defenser",
    "Auto Change Balancer",
    "Wing Attacker",
    "Wing Defenser",
    "Draciel Metal",
    "Dragoon Storm",
    "G Driger",
    "Death Driger",
    "Knight Dranzer",
    "Metal Draciel",
    "Kid Dragoon",
    "Dragoon T",
    "Dranzer S",
    "Galeon Attacker",
    "Galzzly",
    "Galman",
    "Wolborg",
    "Seaborg",
    "B Draciel",
    "Trygle",
    "Trypio",
    "C Driger",
    "Guerrier Dragoon",
    "Dranzer F",
    "Griffolyon",
    "Master Dragoon",
    "Master Dranzer",
    "Master Draciel",
    "F Draciel",
    "Wyborg",
    "Master Driger",
    "Wolborg 2",
    "Dragoon V",
    "Metal Dranzer",
    "Flash Leopard",
    "Driger V",
    "Dranzer V",
    "Cyber Dragoon",
    "Draciel V",
    "Hayate Hidden Spirit",
    "Zinrai Hidden Spirit",
    "Cyber Dranzer",
    "Cyber Draciel",
    "Cyber Driger",
    "Fox",
    "Spider",
    "Sickle Weasel",
    "Tyranno",
    "Clarken",
    "Dragoon",
    "Dranzer",
    "Draciel",
    "Driger",
    "Cereberus",
    "Orthrus",
    "Gabriel",
    "Ariel",
    "Cyber Dragoon",
    "Cyber Driger",
    "Cyber Dranzer",
    "Cyber Draciel",
    "Flash Leopard",
    "Vortex Ape",
    "Sharkrash",
    "Vanishing Moot",
    "Bat",
    "Bus Driver",
    "Chameleon",
    "Daryl",
    "Dizzi",
    "Doctor B",
    "Dunga",
    "Figel",
    "Goki",
    "Gerry",
    "Grandpa",
    "Gideon",
    "Hilary",
    "Jim",
    "Joseph",
    "Kane",
    "Kai",
    "Kenny ",
    "Mariam",
    "Max",
    "Men in Black",
    "Mr. Dickenson",
    "Ozuma/Mister X",
    "Ray",
    "Salima",
    "Snakey",
    "The Robot",
    "Tyson",
};

static const unk8* _807A388[] = {
    "Ultimate Dragoon",
    "Ultimate Saizo",
    "Ultimate Frostic Dranzer",
    "Gekiryu-oh",
    "Megalo Arm",
    "Spark Knight",
    "Polta",
    "Pistol",
    "Makendo",
    "Bakushin-oh",
    "Bump King",
    "Dispositivo di lancio a catapulta",
    "Bearing Stinger",
    "Bound Attacker",
    "Bound Defender",
    "Roller Attacker",
    "Roller Defender",
    "Equilibratore automodificante",
    "Wing Attacker",
    "Wing Defender",
    "Draciel Metal",
    "Attacco tornado",
    "Driger S",
    "Death Driger",
    "Knight Dranzer",
    "Metal Draciel",
    "Kid Dragoon",
    "Dragoon S",
    "Dranzer S",
    "Galeon Attacker",
    "Gazzly",
    "Galman",
    "Wolborg",
    "Seaborg",
    "Scudo Draciel",
    "Trygle",
    "Trypio",
    "Driger F",
    "Dragoon Fighter",
    "Dranzer F",
    "Griffol Hidden Spirit",
    "Master Dragoon",
    "Master Dranzer",
    "Master Draciel",
    "Draciel F",
    "Wyborg",
    "Master Driger",
    "Wolborg 2",
    "Dragoon V",
    "Metal Dranzer",
    "Flash Leopard",
    "Driger V",
    "Dranzer V",
    "Cyber Dragoon",
    "Draciel V",
    "Hayate Hidden Spirit",
    "Zinrai Hidden Spirit",
    "Cyber Dranzer",
    "Cyber Draciel",
    "Cyber Driger",
    "Fox",
    "Spider",
    "Sickle Weasel",
    "Tyranno",
    "Clarken",
    "Dragoon",
    "Dranzer",
    "Draciel",
    "Driger",
    "Cereberus",
    "Orthrus",
    "Gabriel",
    "Ariel",
    "Cyber Dragoon",
    "Cyber Driger",
    "Cyber Dranzer",
    "Cyber Draciel",
    "Flash Leopard",
    "Vortex Ape",
    "Sharkrash",
    "Vanishing Moot",
    "Bat",
    "Bus Driver",
    "Chameleon",
    "Daryl",
    "Dizzi",
    "Doctor B",
    "Dunga",
    "Figel",
    "Goki",
    "Gerry",
    "Grandpa",
    "Gideon",
    "Hilary",
    "Jim",
    "Joseph",
    "Kane",
    "Kay",
    "Kenny ",
    "Mariam",
    "Max",
    "Men in Black",
    "Mr. Dickenson",
    "Ozuma/Mister X",
    "Rey",
    "Salima",
    "Snakey",
    "The Robot",
    "Tyson",
};

unk8 _807a53c[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 };

const unk8** ItemNames[] = { _8079CB8, _8079E6C, _807A020, _807A1D4, _807A388 };

TalkingHead TalkingHeads[] = {
    { 0, { "amy", "amy", "amy", "amy", "amy" }, &SpriteSheet_82CBA28, Pal_82CD048,
        &SpriteSheet_82CBA28, Pal_82CD048 },
    { 1, { "dunga", "dunga", "dunga", "dunga", "dunga" }, &SpriteSheet_82CD248, Pal_82CE7A8,
        &SpriteSheet_82CD248, Pal_82CE7A8 },
    { 2, { "joseph", "joseph", "joseph", "joseph", "joseph" }, &SpriteSheet_82CE9A8, Pal_82CFD88,
        &SpriteSheet_82CE9A8, Pal_82CFD88 },
    { 3, { "kai", "kai", "kai", "kai", "kai" }, &SpriteSheet_82CFF88, Pal_82D1488,
        &SpriteSheet_82CFF88, Pal_82D1488 },
    { 4, { "kane", "kane", "kane", "kane", "kane" }, &SpriteSheet_82D1688, Pal_82D2B88,
        &SpriteSheet_82D2D88, Pal_82D4288 },
    { 5, { "kenny", "kenny", "kenny", "kenny", "kenny" }, &SpriteSheet_82D4488, Pal_82D5AA8,
        &SpriteSheet_82D4488, Pal_82D5AA8 },
    { 6, { "max", "max", "max", "max", "max" }, &SpriteSheet_82D5CA8, Pal_82D7208,
        &SpriteSheet_82D7408, Pal_82D8968 },
    { 7, { "mariam", "mariam", "mariam", "mariam", "mariam" }, &SpriteSheet_82D8B68, Pal_82DA068,
        &SpriteSheet_82D8B68, Pal_82DA068 },
    { 8, { "ozuma", "ozuma", "ozuma", "ozuma", "ozuma" }, &SpriteSheet_82DA268, Pal_82DB7C8,
        &SpriteSheet_82DA268, Pal_82DB7C8 },
    { 9, { "ray", "ray", "ray", "ray", "ray" }, &SpriteSheet_82DB9C8, Pal_82DCEC8,
        &SpriteSheet_82DD0C8, Pal_82DE5C8 },
    { 10, { "tyson", "tyson", "tyson", "tyson", "tyson" }, &SpriteSheet_82DE7C8, Pal_82DF9C8,
        &SpriteSheet_82DE7C8, Pal_82DF9C8 },
    { 11, { "bat", "bat", "bat", "bat", "bat" }, &SpriteSheet_82DFBC8, Pal_82E1078,
        &SpriteSheet_82DFBC8, Pal_82E1078 },
    { 12, { "bus driver", "bus driver", "bus driver", "bus driver", "bus driver" },
        &SpriteSheet_82E1278, Pal_82E28F8, &SpriteSheet_82E1278, Pal_82E28F8 },
    { 13, { "chameleon", "chameleon", "chameleon", "chameleon", "chameleon" }, &SpriteSheet_82E2AF8,
        Pal_82E4178, &SpriteSheet_82E2AF8, Pal_82E4178 },
    { 14, { "daryl", "daryl", "daryl", "daryl", "daryl" }, &SpriteSheet_82E4378, Pal_82E56F8,
        &SpriteSheet_82E4378, Pal_82E56F8 },
    { 15, { "dizzy", "dizzy", "dizzy", "dizzy", "dizzy" }, &SpriteSheet_82E58F8, Pal_82E6A38,
        &SpriteSheet_82E6C38, Pal_82E7D78 },
    { 16, { "dr b", "dr b", "dr b", "dr b", "dr b" }, &SpriteSheet_82E7F78, Pal_82E9298,
        &SpriteSheet_82E7F78, Pal_82E9298 },
    { 17, { "figel", "figel", "figel", "figel", "figel" }, &SpriteSheet_82E9498, Pal_82EA998,
        &SpriteSheet_82E9498, Pal_82EA998 },
    { 18, { "gerry", "gerry", "gerry", "gerry", "gerry" }, &SpriteSheet_82EAB98, Pal_82EC2D8,
        &SpriteSheet_82EAB98, Pal_82EC2D8 },
    { 19, { "gideon", "gideon", "gideon", "gideon", "gideon" }, &SpriteSheet_82EC4D8, Pal_82EDB58,
        &SpriteSheet_82EC4D8, Pal_82EDB58 },
    { 20, { "goki", "goki", "goki", "goki", "goki" }, &SpriteSheet_82EDD58, Pal_82EF258,
        &SpriteSheet_82EF458, Pal_82F0958 },
    { 21, { "grandpa", "grandpa", "grandpa", "grandpa", "grandpa" }, &SpriteSheet_82F0B58,
        Pal_82F1E78, &SpriteSheet_82F0B58, Pal_82F1E78 },
    { 22, { "jim", "jim", "jim", "jim", "jim" }, &SpriteSheet_82F2078, Pal_82F3638,
        &SpriteSheet_82F2078, Pal_82F3638 },
    { 23,
        { "man in black a", "man in black a", "man in black a", "man in black a",
            "man in black a" },
        &SpriteSheet_82F3838, Pal_82F46D8, &SpriteSheet_82F3838, Pal_82F46D8 },
    { 24,
        { "man in black b", "man in black b", "man in black b", "man in black b",
            "man in black b" },
        &SpriteSheet_82F48D8, Pal_82F58F8, &SpriteSheet_82F48D8, Pal_82F58F8 },
    { 25, { "mr dickenson", "mr dickenson", "mr dickenson", "mr dickenson", "mr dickenson" },
        &SpriteSheet_82F5AF8, Pal_82F6ED8, &SpriteSheet_82F5AF8, Pal_82F6ED8 },
    { 26, { "robot on ship", "robot on ship", "robot on ship", "robot on ship", "robot on ship" },
        &SpriteSheet_82F70D8, Pal_82F7B78, &SpriteSheet_82F70D8, Pal_82F7B78 },
    { 27, { "salima", "salima", "salima", "salima", "salima" }, &SpriteSheet_82F7D78, Pal_82F92D8,
        &SpriteSheet_82F7D78, Pal_82F92D8 },
    { 28, { "snakey", "snakey", "snakey", "snakey", "snakey" }, &SpriteSheet_82F94D8, Pal_82FABB8,
        &SpriteSheet_82F94D8, Pal_82FABB8 },
};

unk8 sub_805703C(unk32 arg0)
{
    return _807a53c[arg0];
}

const unk8* sub_8057048(unk32 arg0)
{
    unk32 language;

    language = getLanguageTextIndex();
    return ItemNames[language][arg0];
}

const unk8* sub_8057068(unk32 arg0)
{
    if (sub_80570D4(arg0) != 0) {
        return CollectionPalettes[arg0];
    }
    return Pal_836067C;
}

unk8* sub_8057094(unk32 arg0)
{
    if (sub_80570D4(arg0) != 0) {
        return CollectionSpriteSheets[arg0];
    }
    return SpriteSheet_836087C;
}

const ItemDescriptionEntry* sub_80570C0(unk32 index)
{
    return &ItemDescription[index];
}

unk8 sub_80570D4(s32 arg0)
{
    if ((_currentGameState->unk594[arg0 >> 5] & (1 << (arg0 & 0x1F))) != 0) {
        return 1;
    }
    return 0;
}

void sub_8057104(s32 arg0, unk8 arg1)
{
    if (arg1) {
        _currentGameState->unk594[arg0 >> 5] |= 1 << (arg0 & 0x1F);
    } else {
        _currentGameState->unk594[arg0 >> 5] &= ~(1 << (arg0 & 0x1F));
    }
}

void sub_8057158(FrontendResource* arg0, const InputSequence* arg1)
{
    arg0->state = 0;
    arg0->data = arg1;
    arg0->timer = 0;
}

void sub_8057164(FrontendResource* arg0)
{
    const u16* values;

    values = arg0->data->keys;
    if (arg0->state == arg0->data->count) {
        arg0->state = -1;
    } else if (arg0->state != -1) {
        if (arg0->timer == 0) {
            if (arg0->state != 0) {
                return;
            }
        } else {
            arg0->timer--;
        }
        if (_unk3005DA0 == values[arg0->state]) {
            arg0->timer = 0x3C;
            arg0->state++;
        } else if (_unk3005DA0 != 0) {
            arg0->timer = 0;
            arg0->state = 0;
        }
    }
}

unk8 sub_80571D0(FrontendResource* arg0)
{
    return arg0->state == arg0->data->count;
}

TalkingHead* GetTalkingHead(s32 index)
{
    return &TalkingHeads[index];
}
