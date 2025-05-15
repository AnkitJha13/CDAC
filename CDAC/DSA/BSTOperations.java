import java.util.*;

public class BSTOperations {
    // Inner Node class
    static class Node {
        int key;
        Node left, right;

        Node(int item) {
            key = item;
            left = right = null;
        }
    }

    Node root;

    // 1. Insert a node in BST
    Node insert(Node root, int key) {
        if (root == null) return new Node(key);
        if (key < root.key) root.left = insert(root.left, key);
        else root.right = insert(root.right, key);
        return root;
    }

    // 2. Delete a node in BST
    Node delete(Node root, int key) {
        if (root == null) return null;
        if (key < root.key) root.left = delete(root.left, key);
        else if (key > root.key) root.right = delete(root.right, key);
        else {
            if (root.left == null) return root.right;
            if (root.right == null) return root.left;
            root.key = minValue(root.right);
            root.right = delete(root.right, root.key);
        }
        return root;
    }

    // 3. Search a node in BST
    boolean search(Node root, int key) {
        if (root == null) return false;
        if (root.key == key) return true;
        return key < root.key ? search(root.left, key) : search(root.right, key);
    }

    // 4. Find minimum
    int minValue(Node root) {
        while (root.left != null) root = root.left;
        return root.key;
    }

    // 5. Find maximum
    int maxValue(Node root) {
        while (root.right != null) root = root.right;
        return root.key;
    }

    // 6. Inorder traversal (Recursive)
    void inorder(Node root) {
        if (root != null) {
            inorder(root.left);
            System.out.print(root.key + " ");
            inorder(root.right);
        }
    }

    // 6. Inorder traversal (Iterative)
    void inorderIterative(Node root) {
        Stack<Node> stack = new Stack<>();
        Node current = root;
        while (current != null || !stack.isEmpty()) {
            while (current != null) {
                stack.push(current);
                current = current.left;
            }
            current = stack.pop();
            System.out.print(current.key + " ");
            current = current.right;
        }
    }

    // 7. Preorder traversal (Recursive)
    void preorder(Node root) {
        if (root != null) {
            System.out.print(root.key + " ");
            preorder(root.left);
            preorder(root.right);
        }
    }

    // 7. Preorder traversal (Iterative)
    void preorderIterative(Node root) {
        if (root == null) return;
        Stack<Node> stack = new Stack<>();
        stack.push(root);
        while (!stack.isEmpty()) {
            Node node = stack.pop();
            System.out.print(node.key + " ");
            if (node.right != null) stack.push(node.right);
            if (node.left != null) stack.push(node.left);
        }
    }

    // 8. Postorder traversal (Recursive)
    void postorder(Node root) {
        if (root != null) {
            postorder(root.left);
            postorder(root.right);
            System.out.print(root.key + " ");
        }
    }

    // 8. Postorder traversal (Iterative)
    void postorderIterative(Node root) {
        if (root == null) return;
        Stack<Node> stack1 = new Stack<>();
        Stack<Node> stack2 = new Stack<>();
        stack1.push(root);
        while (!stack1.isEmpty()) {
            Node node = stack1.pop();
            stack2.push(node);
            if (node.left != null) stack1.push(node.left);
            if (node.right != null) stack1.push(node.right);
        }
        while (!stack2.isEmpty()) {
            System.out.print(stack2.pop().key + " ");
        }
    }

    // 9. Level Order Traversal (BFS)
    void levelOrder(Node root) {
        if (root == null) return;
        Queue<Node> queue = new LinkedList<>();
        queue.add(root);
        while (!queue.isEmpty()) {
            Node node = queue.poll();
            System.out.print(node.key + " ");
            if (node.left != null) queue.add(node.left);
            if (node.right != null) queue.add(node.right);
        }
    }

    // Main method
    public static void main(String[] args) {
        BSTOperations bst = new BSTOperations();
        int[] keys = {50, 30, 70, 20, 40, 60, 80};

        for (int key : keys) {
            bst.root = bst.insert(bst.root, key);
        }

        System.out.println("Inorder (Recursive): ");
        bst.inorder(bst.root);

        System.out.println("\nInorder (Iterative): ");
        bst.inorderIterative(bst.root);

        System.out.println("\nPreorder (Recursive): ");
        bst.preorder(bst.root);

        System.out.println("\nPreorder (Iterative): ");
        bst.preorderIterative(bst.root);

        System.out.println("\nPostorder (Recursive): ");
        bst.postorder(bst.root);

        System.out.println("\nPostorder (Iterative): ");
        bst.postorderIterative(bst.root);

        System.out.println("\nLevel Order Traversal: ");
        bst.levelOrder(bst.root);

        System.out.println("\nSearch 60: " + bst.search(bst.root, 60));
        System.out.println("Minimum: " + bst.minValue(bst.root));
        System.out.println("Maximum: " + bst.maxValue(bst.root));

        System.out.println("Delete 20");
        bst.root = bst.delete(bst.root, 20);
        bst.inorder(bst.root);
    }
}
