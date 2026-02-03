import os
import json

# Load translations
with open('descriptions.json', 'r') as f:
    translations = json.load(f)

repo_root = "."

def get_translation(key, section="items"):
    key = key.lower().replace(" ", "_").replace("-", "_")
    if section in translations and key in translations[section]:
        return translations[section][key]
    return None

def generate_qmd(category_key, directory, filename):
    # Korean title for category
    cat_trans = get_translation(category_key, "categories")
    title = cat_trans if cat_trans else category_key.replace("_", " ").title()
    
    content = f"---\ntitle: \"{title}\"\n---\n\n"
    
    dir_path = os.path.join(repo_root, directory)
    if not os.path.exists(dir_path):
        print(f"Directory not found: {dir_path}")
        return

    # Walk through the directory to find subdirectories and files
    # We want to traverse in order
    for root, dirs, files in os.walk(dir_path):
        # Sort directories and files for consistent output
        dirs.sort()
        files.sort()

        rel_path = os.path.relpath(root, dir_path)
        
        # Determine current directory name (for header)
        if rel_path == ".":
            current_dir_name = directory
            depth = 0
            # Root category description if available?
            # Usually we don't put it here to avoid duplication with title, but we can.
        else:
            depth = rel_path.count(os.sep) + 1
            current_dir_name = os.path.basename(root)
            
            # Create header for the subdirectory
            # Try to find translation for the directory
            trans = get_translation(current_dir_name)
            
            if trans:
                 display_name = trans['title']
                 desc = trans.get('desc', '')
            else:
                 display_name = current_dir_name.replace("_", " ").title()
                 desc = ""
            
            header_level = min(depth + 2, 6) # Start at h3 (h2 is usually top level context)
            # Actually quarto title creates h1, so we start at h2 or h3.
            # Let's use standard markdown headers #, ##, ###
            
            content += f"{'#' * header_level} {display_name}\n\n"
            
            if desc:
                content += f"{desc}\n\n"

        swift_files = [f for f in files if f.endswith(".swift")]
        
        for f in swift_files:
            file_key = f.replace(".swift", "")
            trans = get_translation(file_key)
            
            if trans:
                 display_name = trans['title']
                 desc = trans.get('desc', '')
            else:
                 display_name = file_key.replace("_", " ").title()
                 desc = ""
            
            # Sub-header for the file
            content += f"**{display_name}**\n\n"
            
            if desc:
                content += f"{desc}\n\n"
            
            file_path = os.path.join(root, f)
            try:
                with open(file_path, "r") as code_file:
                    code_content = code_file.read()
                    content += "```swift\n"
                    content += code_content
                    content += "\n```\n\n"
            except Exception as e:
                print(f"Error reading {file_path}: {e}")

    with open(filename, "w") as qmd_file:
        qmd_file.write(content)
    print(f"Generated {filename}")

# Categories based on folders
categories_map = {
    "algorithms": "algorithms",
    "data_structures": "data_structures",
    "graph": "graph",
    "recursion": "recursion",
    "search": "Search",
    "sorts": "sorts",
    "trees": "trees"
}

for key, directory in categories_map.items():
    if directory == "Search":
        filename = "search.qmd"
    elif directory == "data_structures":
        filename = "data_structures.qmd"
    else:
        filename = f"{directory.lower()}.qmd"
        
    generate_qmd(key, directory, filename)
