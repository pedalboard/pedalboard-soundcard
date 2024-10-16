.DEFAULT_GOAL := help

GIT_HASH = $(shell git rev-parse HEAD:sourceDirectory HEAD:file.py | git hash-object --stdin)
PROJECT_NAME = pedalboard-soundcard

test: ## Run ERC and DRC checks
	mkdir -p out
	kicad-cli sch erc \
		--define-var GIT_HASH=$(GIT_HASH) \
		--output out/erc.rpt \
		--severity-warning \
		--severity-error \
		--exit-code-violations \
		$(PROJECT_NAME).kicad_sch
	kicad-cli pcb drc \
		--schematic-parity \
		--define-var GIT_HASH=$(GIT_HASH) \
		--output out/drc.rpt \
		--severity-error \
		--severity-warning \
		--exit-code-violations \
		$(PROJECT_NAME).kicad_pcb


step: ## export 3D model
	mkdir -p out
	kicad-cli pcb export step \
		--define-var GIT_HASH=$(GIT_HASH) \
		--output out/$(PROJECT_NAME).step \
		--subst-models \
		--force \
		$(PROJECT_NAME).kicad_pcb

pdf: ## export PDF (schematic and PCB)
	mkdir -p out
	kicad-cli pcb export pdf \
		--define-var GIT_HASH=$(GIT_HASH) \
		--output out/$(PROJECT_NAME)-pcb-front.pdf \
		--layers F.Cu \
		$(PROJECT_NAME).kicad_pcb
	kicad-cli pcb export pdf \
		--define-var GIT_HASH=$(GIT_HASH) \
		--output out/$(PROJECT_NAME)-pcb-back.pdf \
		--layers B.Cu \
		$(PROJECT_NAME).kicad_pcb
	kicad-cli sch export pdf \
		--define-var GIT_HASH=$(GIT_HASH) \
		--output out/$(PROJECT_NAME)-schematic.pdf \
		$(PROJECT_NAME).kicad_sch

bom: ## export BOM
	mkdir -p out
	kicad-cli sch export bom \
    --preset "Grouped By Value" \
		--output out/$(PROJECT_NAME)-bom.csv \
		$(PROJECT_NAME).kicad_sch

pos: ## export Position file
	mkdir -p out
	kicad-cli pcb export pos \
		--output out/$(PROJECT_NAME).pos \
		--format csv \
		--side front \
		--units mm \
		--smd-only \
		$(PROJECT_NAME).kicad_pcb

clean:
	rm -rf out

panel: ## panelize the project
	mkdir -p out/panel
	kikit panelize -p panel.json $(PROJECT_NAME).kicad_pcb out/panel/panel.kicad_pcb

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
