//
//  fetch_takehomeTests.swift
//  fetch_takehomeTests
//
//  Created by Patrick Meyer on 12/2/24.
//

import XCTest
import Testing
@testable import fetch_takehome

class RecipesServiceTests: XCTestCase {
    func testFetchRecipes_Success() async throws {
        let service = RecipesService()
        let recipes = try await service.fetchRecipes()
        XCTAssertFalse(recipes.isEmpty)
    }
    
    func testFetchRecipes_InvalidData() async {
        let service = RecipesService()
        let malformedDataURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")!
        
        do {
            _ = try await service.fetchRecipes(from: malformedDataURL)
            XCTFail("Expected error but got success.")
        } catch let error as RecipesServiceError {
            XCTAssertEqual(error, .invalidData, "Expected invalidData error but got \(error)")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}

@MainActor
class RecipesViewModelTests: XCTestCase {
    func testLoadRecipes_Success() async {
        let viewModel = RecipesViewModel()
        await viewModel.loadRecipes()

        // Assert on the main actor
        await MainActor.run {
            XCTAssertFalse(viewModel.recipes.isEmpty, "The recipes list should not be empty.")
        }
    }

    func testLoadRecipes_ErrorHandling() async {
        // Use a mock service to simulate an error
        let mockService = MockRecipesService()
        let viewModel = RecipesViewModel(service: mockService)
        
        await viewModel.loadRecipes()

        // Assert on the main actor
        await MainActor.run {
            XCTAssertNotNil(viewModel.errorMessage, "Error message should not be nil on failure.")
            XCTAssertEqual(viewModel.errorMessage, "Failed to load recipes. Please try again.")
        }
    }
}
