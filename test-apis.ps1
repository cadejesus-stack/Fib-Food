#!/usr/bin/env pwsh

# Script de teste de APIs Fib-Food
# Valida os principais endpoints

Write-Host "=== TESTE DE APIs Fib-Food ===" -ForegroundColor Cyan

$apis = @(
    @{name = "Tenant API"; url = "http://localhost:8010/health"},
    @{name = "Order API"; url = "http://localhost:8012/health"},
    @{name = "Catalog API"; url = "http://localhost:8011/health"},
    @{name = "Kitchen API"; url = "http://localhost:8013/health"},
    @{name = "Reservation API"; url = "http://localhost:8014/health"},
    @{name = "Delivery API"; url = "http://localhost:8015/health"},
    @{name = "Loyalty API"; url = "http://localhost:8016/health"}
)

$passed = 0
$failed = 0

foreach ($api in $apis) {
    try {
        $response = Invoke-WebRequest -Uri $api.url -UseBasicParsing -TimeoutSec 5
        Write-Host "✅ $($api.name) - Status: $($response.StatusCode)" -ForegroundColor Green
        $passed++
    }
    catch {
        Write-Host "❌ $($api.name) - Erro: $($_.Exception.Message)" -ForegroundColor Red
        $failed++
    }
}

Write-Host ""
Write-Host "=== RESUMO ===" -ForegroundColor Cyan
Write-Host "✅ Passou: $passed" -ForegroundColor Green
Write-Host "❌ Falhou: $failed" -ForegroundColor Red
Write-Host ""

# Testar endpoints principais
Write-Host "=== TESTE DE ENDPOINTS PRINCIPAIS ===" -ForegroundColor Cyan

$endpoints = @(
    @{name = "Listar Mesas"; method = "GET"; url = "http://localhost:8012/tables"},
    @{name = "Listar Pedidos"; method = "GET"; url = "http://localhost:8012/orders"},
    @{name = "Listar Produtos"; method = "GET"; url = "http://localhost:8011/products"},
    @{name = "Listar Categorias"; method = "GET"; url = "http://localhost:8011/categories"},
    @{name = "Listar Reservas"; method = "GET"; url = "http://localhost:8014/reservations"},
    @{name = "Listar Entregas"; method = "GET"; url = "http://localhost:8015/deliveries"},
    @{name = "Listar Clientes Fidelidade"; method = "GET"; url = "http://localhost:8016/loyalty/customers"}
)

$endpoint_passed = 0
$endpoint_failed = 0

foreach ($endpoint in $endpoints) {
    try {
        $response = Invoke-WebRequest -Uri $endpoint.url -Method $endpoint.method -UseBasicParsing -TimeoutSec 5
        Write-Host "✅ $($endpoint.name) - Status: $($response.StatusCode)" -ForegroundColor Green
        $endpoint_passed++
    }
    catch {
        Write-Host "⚠️ $($endpoint.name) - Status: $($_.Exception.Response.StatusCode)" -ForegroundColor Yellow
        $endpoint_failed++
    }
}

Write-Host ""
Write-Host "=== RESUMO ENDPOINTS ===" -ForegroundColor Cyan
Write-Host "✅ Passou: $endpoint_passed" -ForegroundColor Green
Write-Host "⚠️ Com issue: $endpoint_failed" -ForegroundColor Yellow
