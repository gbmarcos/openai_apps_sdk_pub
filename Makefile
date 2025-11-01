.PHONY: gen clean watch


gen: ## Generates the code
	@echo "╠ Generating the code..."
	@flutter pub get
	@dart pub run build_runner build --delete-conflicting-outputs

clean: ## Cleans the environment
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@flutter clean
	@flutter pub get
	@flutter pub upgrade firebase_authentication # update firebase authentication custom package


watch: ## Generates the assets
	@echo "╠ Watching runner..."
	@dart run build_runner watch --delete-conflicting-outputs
