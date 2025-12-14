
.PHONY: all clean run

all: clean a.out

a.out: main.S io.S
	@$(MAKE) -C ../ASM
	@../ASM/target/asm main.S
	@echo "Created a.out"

run: a.out
	@$(MAKE) -C ../CPU
	@../CPU/target/emu $(EARGS) ./a.out
	@echo "Done!"

clean:
	@rm -f a.out
	@$(MAKE) -C ../ASM clean
	@$(MAKE) -C ../CPU clean
	@echo "Cleaned!"
