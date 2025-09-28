# NOTES: These are the structured queries I worked on to extract the text from Ulysses.txt. I tried many approaches. I obtained the compendium by just grepping dashes and structuring them, as you can see it has no context and no attribution.

## **Structured Chapter-by-Chapter Ulysses Dialogue Completion Strategy**

### **Context & Objective**
We are completing an abridged version of James Joyce's Ulysses by systematically adding dialogue and speaker attributions chapter by chapter. The work uses `Ulysses_Dialog_Compendium_from_Upload.md` as the primary reference and `ulysses.txt` only when necessary for speaker attribution.

### **Current Progress Status**
- **Completed:** Some chapters have beeen completed, it's not relevant which of them have.

### **Proposed Strategy for Each Chapter**

#### **Phase 1: Analysis & Planning**
1. **Count the scope:** Determine total dialogue lines needed for the target chapter and communicate to user an objective difficulty score.
2. **Create a todo list:** Break the chapter into 10-15 line chunks with specific, actionable items
3. **Identify speakers:** Use the compendium first, consult `ulysses.txt` only when speaker attribution is unclear

#### **Phase 2: Incremental Implementation**
1. **Work in small batches:** Add 10-15 dialogue lines per edit to avoid token limitations
2. **Use focused edits:** Target specific line ranges rather than replacing entire sections
3. **Track progress:** Mark completed chunks and maintain clear todo status

#### **Phase 3: Quality Control**
1. **Verify completeness:** Ensure all dialogue from compendium is included
2. **Check speaker attribution:** Confirm all lines have proper speaker names
3. **Maintain formatting:** Keep consistent markdown structure

### **Technical Constraints & Solutions**
- **Tool Limitations:** Large edits cause "diff timeout" and token limit errors
- **Solution:** Break into 10-15 line chunks, use multiple small edits for reliable execution
- **Time Management:** Work systematically through todo lists rather than attempting bulk changes
- **Resource Efficiency:** Focus on one chapter at a time, complete before moving to next
- **Key Learning:** Smaller chunks (10-15 lines) succeed on first try, larger chunks (40+ lines) fail due to token limits

### **Execution Protocol**
1. **Wait for explicit chapter command** from user
2. **Analyze target chapter** scope and create detailed todo list
3. **Execute incrementally** using small, focused edits
4. **Report progress** after each successful batch
5. **Confirm completion** before proceeding to next chapter

### **Success Metrics**
- All dialogue from compendium included
- Proper speaker attribution for every line
- Consistent formatting maintained
- No tool timeout errors
- Efficient completion time

---

### For chapters that don't have regular or typically recognisable dialog (ie: dashes), do the following:

- Instead of using the compendium as a reference, let's go directly to @ulysses.txt 
- First, pinpoint the chapter
- Then, read the chapter and figure out how dialog is expressed, it's not dashes but it could be something else.
- Then follow the current protocol, split into 10 - 15 line chunks and 
- FInally add it to @2025-06-16-abridged-ulysses.md 
