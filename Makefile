.DEFAULT_GOAL := help

.PHONY: panel

panel: ## panelize the project
	mkdir -p generated/panel
	kikit panelize -p panel.json ./pedalboard-soundcard.kicad_pcb generated/panel/panel.kicad_pcb

help: ## show this help for targets
	@grep -E --no-filename '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

