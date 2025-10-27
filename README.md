### Hi there!
#### Did you know that you can use classes in the PowerShell, starting from 5.0? I didn't... So! Let's dive into this topic! 

### Where to use classes approach?
🧩 1. Reusable Script Modules (structured logic) - 🟢 Great for modules that manage services, VMs, containers, or files — keeps each resource’s state encapsulated.
🧰 2. Complex Configuration or Data Models
🧾 3. Validation & Business Logic
📦 4. Tooling, plugins, or custom providers
🧪 5. Testing and Mocking
🗂️ 6. Background jobs or async task wrappers

### For those who is like me thought that "hey! We have got cmdlets aleaady and functions!"

⚙️ Functions vs Classes in PowerShell
| Feature         | **Function**                                     | **Class**                                                    |
| --------------- | ------------------------------------------------ | ------------------------------------------------------------ |
| **Purpose**     | Encapsulate *actions or operations*              | Model *objects/entities with state and behavior*             |
| **Style**       | Procedural / Functional                          | Object-Oriented (OOP)                                        |
| **Definition**  | `function Do-Thing { ... }`                      | `class Thing { ... }`                                        |
| **Stores data** | No (stateless — works with parameters/variables) | Yes (has properties that persist)                            |
| **Reusability** | Reuse logic by calling it                        | Reuse by creating instances or inheritance                   |
| **Composition** | Combine with pipelines or other functions        | Combine with inheritance or method calls                     |
| **Best for**    | Short scripts, automation tasks                  | Complex logic, reusable libraries, or structured data models |
| **Scope**       | Exists as a command                              | Produces objects you can interact with                       |
| **Analogy**     | A *verb* (“run”, “get”, “start”)                 | A *noun* (“user”, “server”, “config”)                        |


### Quick guide where and how to use.
| Situation                                                 | Use          |
| --------------------------------------------------------- | ------------ |
| Quick one-off automation                                  | **Function** |
| You need to perform one action and exit                   | **Function** |
| You need to model real entities (VMs, users, configs)     | **Class**    |
| You want reusable, maintainable logic with internal state | **Class**    |
| You plan to extend or inherit behavior later              | **Class**    |
