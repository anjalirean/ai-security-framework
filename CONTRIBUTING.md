# Contributing to AI Security Framework

Thank you for your interest in contributing to the AI Security Framework!

## How to Contribute

### Reporting Issues

If you find bugs, documentation errors, or have suggestions:

1. Check if the issue already exists in [Issues](https://github.com/anjalirean/ai-security-framework/issues)
2. If not, create a new issue with:
   - Clear description of the problem
   - Steps to reproduce (if applicable)
   - Expected vs actual behavior
   - Your environment details

### Proposing New Test Scenarios

To contribute new attack scenarios:

1. Verify the scenario isn't already in the [docs/ATTACK_SCENARIOS.md](docs/)
2. Open an issue describing:
   - Attack category
   - Attack technique
   - Expected detection behavior
   - Why it's important

### Code Contributions

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-scenario`)
3. Make your changes
4. Add tests if applicable
5. Update documentation
6. Commit with clear messages
7. Push to your fork
8. Submit a Pull Request

### Documentation Improvements

Documentation contributions are valuable:
- Fix typos or clarify explanations
- Add examples or use cases
- Improve setup instructions
- Add diagrams or visualizations

## Ethical Guidelines

All contributions must adhere to our ethical framework:

- ✅ All testing in isolated environments only
- ✅ No malicious use cases
- ✅ Responsible disclosure practices
- ✅ Educational and defensive purposes only
- ❌ No testing on production systems
- ❌ No unauthorized access attempts

## Code Style

- Follow PEP 8 for Python code
- Add docstrings to functions and classes
- Include type hints where appropriate
- Write clear, descriptive commit messages

## Testing

Before submitting:
```bash
# Run tests
pytest tests/

# Check code style
flake8 framework/
```

## Questions?

- Open a [Discussion](https://github.com/anjalirean/ai-security-framework/discussions)
- Email: anjalignair02@gmail.com

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
