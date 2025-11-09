.PHONY: gen clean watch build


gen: ## Generates the code
	@echo "╠ Generating the code..."
	@flutter pub get
	@dart pub run build_runner build --delete-conflicting-outputs

clean: ## Cleans the environment
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@flutter clean
	@flutter pub get


watch: ## Generates the assets
	@echo "╠ Watching runner..."
	@dart run build_runner watch --delete-conflicting-outputs

build: ## Builds the project
	@echo "╠ Building the project..."
	@flutter build web --debug