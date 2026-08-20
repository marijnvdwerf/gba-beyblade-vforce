ENTRY(Start)

SECTIONS {

    . = 0x3000000;

    iwram (NOLOAD) :
    ALIGN(4)
    {
        src/ram.c.o(.data);
        *libgcc.a:fp-bit.o(.bss);
        *libgcc.a:dp-bit.o(.bss);
        . = 0xDE0;
        _unk3000DE0 = .;
        . += 0x10;
        src/ram2.c.o(.data);
        src/memory.c.o(.data);
        . += 12;
        src/keystate.c.o(.data);
        src/ram3.c.o(.data);

        _iwram_code_start = .;
    }

    . = 0x8000000;

    .text :
    ALIGN(4)
    {
        asm/crt0.s.o(.text);
        data/7-7/metadata.s.o(.text);
        data/7-6/metadata.s.o(.text);
        data/7-5/metadata.s.o(.text);
        data/7-4/metadata.s.o(.text);
        data/7-3/metadata.s.o(.text);
        data/7-2/metadata.s.o(.text);
        data/7-1/metadata.s.o(.text);
        data/7-8/metadata.s.o(.text);
        data/6-7/metadata.s.o(.text);
        data/6-6/metadata.s.o(.text);
        data/6-5/metadata.s.o(.text);
        data/6-4/metadata.s.o(.text);
        data/6-3/metadata.s.o(.text);
        data/6-2/metadata.s.o(.text);
        data/6-1/metadata.s.o(.text);
        data/6-8/metadata.s.o(.text);
        data/5-7/metadata.s.o(.text);
        data/5-6/metadata.s.o(.text);
        data/5-5/metadata.s.o(.text);
        data/5-4/metadata.s.o(.text);
        data/5-3/metadata.s.o(.text);
        data/5-2/metadata.s.o(.text);
        data/5-1/metadata.s.o(.text);
        data/5-8/metadata.s.o(.text);
        data/4-7/metadata.s.o(.text);
        data/4-6/metadata.s.o(.text);
        data/4-5/metadata.s.o(.text);
        data/4-4/metadata.s.o(.text);
        data/4-3/metadata.s.o(.text);
        data/4-2/metadata.s.o(.text);
        data/4-1/metadata.s.o(.text);
        data/4-8/metadata.s.o(.text);
        data/3-7/metadata.s.o(.text);
        data/3-6/metadata.s.o(.text);
        data/3-5/metadata.s.o(.text);
        data/3-4/metadata.s.o(.text);
        data/3-3/metadata.s.o(.text);
        data/3-2/metadata.s.o(.text);
        data/3-1/metadata.s.o(.text);
        data/3-8/metadata.s.o(.text);
        data/2-7/metadata.s.o(.text);
        data/2-6/metadata.s.o(.text);
        data/2-5/metadata.s.o(.text);
        data/2-4/metadata.s.o(.text);
        data/2-3/metadata.s.o(.text);
        data/2-2/metadata.s.o(.text);
        data/2-1/metadata.s.o(.text);
        data/2-8/metadata.s.o(.text);
        data/1-7/metadata.s.o(.text);
        data/1-6/metadata.s.o(.text);
        data/1-5/metadata.s.o(.text);
        data/1-4/metadata.s.o(.text);
        data/1-3/metadata.s.o(.text);
        data/1-2/metadata.s.o(.text);
        data/1-1/metadata.s.o(.text);
        data/1-8/metadata.s.o(.text);
        asm/audio0.s.o(.text);
        src/credits.c.o(.text);
        src/levelselect.c.o(.text);
        src/dialogue.c.o(.text);
        src/transition.c.o(.text);
        src/collection.c.o(.text);
        src/profile.c.o(.text);
        src/menuobject.c.o(.text);
        src/packet.c.o(.text);
        src/festate.c.o(.text);
        src/frontend.c.o(.text);
        src/background.c.o(.text);
        src/levelrow.c.o(.text);
        src/tutorial.c.o(.text);
        src/trail.c.o(.text);
        src/music.c.o(.text);
        src/rider.c.o(.text);
        src/projectile.c.o(.text);
        src/riderphysics.c.o(.text);
        src/particle.c.o(.text);
        src/hud.c.o(.text);
        src/levelhud.c.o(.text);
        src/riderstate.c.o(.text);
        src/motion.c.o(.text);
        src/main.c.o(.text);
        src/display.c.o(.text);
        src/iconmenu.c.o(.text);
        src/gamestate.c.o(.text);
        src/gameloop.c.o(.text);
        src/results.c.o(.text);
        src/gameinit.c.o(.text);
        src/event.c.o(.text);
        src/envactor.c.o(.text);
        src/effects.c.o(.text);
        src/collision.c.o(.text);
        src/collectable.c.o(.text);
        src/beyblade.c.o(.text);
        src/battery.c.o(.text);
        src/ai.c.o(.text);
        src/bios.c.o(.text);
        src/code_8057944.c.o(.text);
        src/irq.c.o(.text);
        src/system.c.o(.text);
        src/debug.c.o(.text);
        src/actor.c.o(.text);
        src/layer.c.o(.text);
        src/math.c.o(.text);
        src/memory.c.o(.text);
        src/keystate.c.o(.text);
        src/menu.c.o(.text);
        src/text.c.o(.text);
        src/geometry.c.o(.text);
        src/camera.c.o(.text);
        src/render.c.o(.text);
        src/anim.c.o(.text);
        src/animevent.c.o(.text);
        src/multiplayer.c.o(.text);
        src/sprite.c.o(.text);
        src/spritetext.c.o(.text);
        src/sound.c.o(.text);
        src/actorheap.c.o(.text);
        src/palette.c.o(.text);
        src/language.c.o(.text);
        src/teletype.c.o(.text);
        asm/arm1.s.o(.text);
        src/spritestring.c.o(.text);
        src/backup.c.o(.text);
        *libgcc.a:_call_via_rX.o(.text);
        *libgcc.a:_divdi3.o(.text);
        *libgcc.a:_divsi3.o(.text);
        *libgcc.a:_dvmd_tls.o(.text);
        *libgcc.a:_fixunssfsi.o(.text);
        *libgcc.a:_muldi3.o(.text);
        *libgcc.a:_udivsi3.o(.text);
        *libgcc.a:_umodsi3.o(.text);
        *libgcc.a:fp-bit.o(.text);
        *libgcc.a:dp-bit.o(.text);
        *libgcc.a:_lshrdi3.o(.text);
        *libgcc.a:_negdi2.o(.text);
        src/libc.c.o(.text);
    }

    .rodata :
    ALIGN(4)
    {
		asm/data10.s.o(.rodata);
		asm/data12.s.o(.rodata);
		asm/data11.s.o(.rodata);
		asm/audio1.s.o(.rodata);
		asm/data9.s.o(.rodata);
		asm/data8.s.o(.rodata);
		asm/audio2.s.o(.rodata);
		asm/dataA.s.o(.rodata);
		data/1-1/geometry.s.o(.rodata);
        data/1-2/geometry.s.o(.rodata);
        data/1-3/geometry.s.o(.rodata);
        data/1-4/geometry.s.o(.rodata);
        data/1-5/geometry.s.o(.rodata);
        data/1-6/geometry.s.o(.rodata);
        data/1-7/geometry.s.o(.rodata);
        data/1-8/geometry.s.o(.rodata);
        data/2-1/geometry.s.o(.rodata);
        data/2-2/geometry.s.o(.rodata);
        data/2-3/geometry.s.o(.rodata);
        data/2-4/geometry.s.o(.rodata);
        data/2-5/geometry.s.o(.rodata);
        data/2-6/geometry.s.o(.rodata);
        data/2-7/geometry.s.o(.rodata);
        data/2-8/geometry.s.o(.rodata);
        data/3-1/geometry.s.o(.rodata);
        data/3-2/geometry.s.o(.rodata);
        data/3-3/geometry.s.o(.rodata);
        data/3-4/geometry.s.o(.rodata);
        data/3-5/geometry.s.o(.rodata);
        data/3-6/geometry.s.o(.rodata);
        data/3-7/geometry.s.o(.rodata);
        data/3-8/geometry.s.o(.rodata);
        data/4-1/geometry.s.o(.rodata);
        data/4-2/geometry.s.o(.rodata);
        data/4-3/geometry.s.o(.rodata);
        data/4-4/geometry.s.o(.rodata);
        data/4-5/geometry.s.o(.rodata);
        data/4-6/geometry.s.o(.rodata);
        data/4-7/geometry.s.o(.rodata);
        data/4-8/geometry.s.o(.rodata);
        data/5-1/geometry.s.o(.rodata);
        data/5-2/geometry.s.o(.rodata);
        data/5-3/geometry.s.o(.rodata);
        data/5-4/geometry.s.o(.rodata);
        data/5-5/geometry.s.o(.rodata);
        data/5-6/geometry.s.o(.rodata);
        data/5-7/geometry.s.o(.rodata);
        data/5-8/geometry.s.o(.rodata);
        data/6-1/geometry.s.o(.rodata);
        data/6-2/geometry.s.o(.rodata);
        data/6-3/geometry.s.o(.rodata);
        data/6-4/geometry.s.o(.rodata);
        data/6-5/geometry.s.o(.rodata);
        data/6-6/geometry.s.o(.rodata);
        data/6-7/geometry.s.o(.rodata);
        data/6-8/geometry.s.o(.rodata);
        data/7-1/geometry.s.o(.rodata);
        data/7-2/geometry.s.o(.rodata);
        data/7-3/geometry.s.o(.rodata);
        data/7-4/geometry.s.o(.rodata);
        data/7-5/geometry.s.o(.rodata);
        data/7-6/geometry.s.o(.rodata);
        data/7-7/geometry.s.o(.rodata);
        data/7-8/geometry.s.o(.rodata);
		asm/data6.s.o(.rodata);
		asm/dataB.s.o(.rodata);
		asm/data7.s.o(.rodata);
		asm/dataC.s.o(.rodata);
		src/strings0.c.o(.rodata);
		src/strings3.c.o(.rodata);
		asm/data1.s.o(.rodata);
		src/memory.c.o(.rodata);
		src/keystate.c.o(.rodata);
		src/strings4.c.o(.rodata);
		src/sprite.c.o(.rodata);
		src/strings7.c.o(.rodata);
		asm/data4.s.o(.rodata);
		src/sound.c.o(.rodata);
		src/strings5.c.o(.rodata);
		asm/data5.s.o(.rodata);
		src/strings6.c.o(.rodata);
		asm/data3.s.o(.rodata);

        *libgcc.a:_divdi3.o(.rodata);
    } =0

    /* ARM routines that run from IWRAM: linked at their IWRAM run-time
     * addresses (VMA), stored in ROM right after .rodata (LMA). crt0
     * copies LOADADDR(.iwram_code)..+SIZEOF into place at boot. */
    .iwram_code _iwram_code_start : AT(ADDR(.rodata) + SIZEOF(.rodata))
    {
        asm/arm2.s.o(.text);
        fn_end = .;
    }
    __iwram_code_lma = LOADADDR(.iwram_code);

    /* DWARF 2 sections */
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    .debug_info     0 : { *(.debug_info) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }

    /* Discard everything not specifically mentioned above. */
    /DISCARD/ :
    {
        *(*);
    }
}
